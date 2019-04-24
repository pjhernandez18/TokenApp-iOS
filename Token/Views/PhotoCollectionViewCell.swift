//
//  TokenCell.swift
//  Token
//
//  Created by Jason Silberman on 4/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
	let imageView = UIImageView()
	var assetIdentifier: String?
	
	var showsSelection: Bool = false {
		didSet {
			layer.borderWidth = showsSelection ? 3 : 0
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupHierarchy() {
		layer.borderColor = UIColor.blue.cgColor
		
		contentView.layer.masksToBounds = true
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
