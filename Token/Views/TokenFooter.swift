//
//  TokenFooter.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TokenFooter: UICollectionReusableView {
	let button = UIButton(frame: .zero)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupHierarchy() {
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .orange
		button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
		button.layer.cornerRadius = 8
		button.layer.shadowRadius = 4
		button.layer.shadowOffset = CGSize(width: 0, height: 2)
		button.layer.shadowOpacity = 0.3
		button.layer.shadowColor = UIColor.black.cgColor
		addSubview(button)
		
		backgroundColor = .white
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: centerXAnchor),
			button.topAnchor.constraint(equalTo: topAnchor, constant: 40),
			button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
		])
	}
}
