//
//  TokenHeader.swift
//  Token
//
//  Created by Jason Silberman on 4/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TokenHeader: UICollectionReusableView {
	let label: UILabel = UILabel(frame: .zero)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupHierarchy() {
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.numberOfLines = 0
		addSubview(label)
		
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: leadingAnchor),
			label.trailingAnchor.constraint(equalTo: trailingAnchor),
			label.topAnchor.constraint(equalTo: topAnchor),
			label.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
