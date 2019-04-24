//
//  RecommendationCell.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class RecommendationCell: UITableViewCell {
	let stackView = UIStackView(arrangedSubviews: [])
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupHierarchy() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(stackView)
		
		let label = UILabel()
		label.text = "Go HERE! recommendations yo ;)"
		
		stackView.addArrangedSubview(label)
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
