//
//  PreviewViewController.swift
//  Token
//
//  Created by Jason Silberman on 4/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
	
	let previewView = UIView(frame: .zero)
	
	let bottomView = UIView(frame: .zero)
	let cancel = UIButton(frame: .zero)
	let tripLabel = UILabel(frame: .zero)
	let locationLabel = UILabel(frame: .zero)
	let addButton = UIButton(frame: .zero)
	
	var ratio: CGFloat = 4/3
	var topPadded = true
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		previewView.backgroundColor = .green
		previewView.layer.cornerRadius = 14
		previewView.layer.masksToBounds = true
		previewView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(previewView)
		
		view.backgroundColor = .tokenBlue
		
		// bottom
		
		bottomView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bottomView)
		
		cancel.setTitle("Cancel", for: .normal)
		cancel.translatesAutoresizingMaskIntoConstraints = false
		cancel.backgroundColor = .tokenYellow
		cancel.addTarget(self, action: #selector(close), for: .touchUpInside)
		bottomView.addSubview(cancel)
		
		tripLabel.text = "Spain"
		tripLabel.textAlignment = .center
		tripLabel.translatesAutoresizingMaskIntoConstraints = false
		bottomView.addSubview(tripLabel)
		
		locationLabel.text = "USC Campus"
		locationLabel.textAlignment = .center
		locationLabel.translatesAutoresizingMaskIntoConstraints = false
		bottomView.addSubview(locationLabel)
		
		addButton.setTitle("Add to Trip", for: .normal)
		addButton.translatesAutoresizingMaskIntoConstraints = false
		addButton.backgroundColor = .purple
		bottomView.addSubview(addButton)
		
		view.setNeedsUpdateConstraints()
	}
	
	override func updateViewConstraints() {
		super.updateViewConstraints()
		
		let topConstant: CGFloat = view.layoutMargins.top == 0 ? 20 : view.layoutMargins.top
		
		NSLayoutConstraint.activate([
			previewView.leftAnchor.constraint(equalTo: view.leftAnchor),
			previewView.rightAnchor.constraint(equalTo: view.rightAnchor),
			previewView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadded ? topConstant : 0),
			previewView.heightAnchor.constraint(equalTo: previewView.widthAnchor, multiplier: ratio),
			
			bottomView.leftAnchor.constraint(equalTo: view.leftAnchor),
			bottomView.rightAnchor.constraint(equalTo: view.rightAnchor),
			bottomView.topAnchor.constraint(equalTo: previewView.bottomAnchor),
			bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			cancel.leftAnchor.constraint(equalTo: bottomView.layoutMarginsGuide.leftAnchor),
			cancel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
			
			tripLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
			tripLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
			
			locationLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
			locationLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
			
			addButton.bottomAnchor.constraint(equalTo: bottomView.layoutMarginsGuide.bottomAnchor),
			addButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
		])
	}
	
	@objc func close() {
		dismiss(animated: true, completion: nil)
	}
}
