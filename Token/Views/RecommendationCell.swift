//
//  RecommendationCell.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension UIImage {
	func imageWithInsets(insets: UIEdgeInsets) -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(
			CGSize(width: self.size.width + insets.left + insets.right,
				   height: self.size.height + insets.top + insets.bottom), false, self.scale)
		let _ = UIGraphicsGetCurrentContext()
		let origin = CGPoint(x: insets.left, y: insets.top)
		self.draw(at: origin)
		let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return imageWithInsets
	}
}

class RecommendationCell: UITableViewCell {
	let topStackView = UIStackView(arrangedSubviews: [])
	let bottomStackView = UIStackView(arrangedSubviews: [])
	let background = UIView(frame: .zero)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupHierarchy() {
		background.translatesAutoresizingMaskIntoConstraints = false
		background.backgroundColor = UIColor(white: 0.95, alpha: 1)
		background.layer.cornerRadius = 8
		contentView.addSubview(background)
		
		topStackView.translatesAutoresizingMaskIntoConstraints = false
		topStackView.axis = .horizontal
		topStackView.distribution = .fillEqually
		topStackView.alignment = .top
		topStackView.spacing = 10
		contentView.addSubview(topStackView)
		
		bottomStackView.translatesAutoresizingMaskIntoConstraints = false
		bottomStackView.axis = .horizontal
		bottomStackView.distribution = .fillEqually
		bottomStackView.alignment = .top
		bottomStackView.spacing = 10
		contentView.addSubview(bottomStackView)
		
		let pin = UIImageView(image: UIImage(named: "Pin_Yellow")!)
		let pinRating = UILabel()
		pinRating.text = "★★★☆"
		let beach = UIImageView(image: UIImage(named: "Beach 1")!)
		let beachRating = UILabel()
		beachRating.text = "★★★★"
		let restaurant = UIImageView(image: UIImage(named: "Resteruant")!)
		let restaurantRating = UILabel()
		restaurantRating.text = "★★★★"
		let bar = UIImageView(image: UIImage(named: "Bar")!)
		let barRating = UILabel()
		barRating.text = "★★☆☆"
		
		for imageView in [pin, beach, restaurant, bar] {
			imageView.backgroundColor = .white
			imageView.image = imageView.image?.imageWithInsets(insets: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
			imageView.contentMode = .scaleAspectFit
			imageView.layer.cornerRadius = 8
		}
		
		for label in [pinRating, beachRating, restaurantRating, barRating] {
			label.textColor = .tokenBlue
		}
		
		topStackView.addArrangedSubview(pin)
		topStackView.addArrangedSubview(pinRating)
		topStackView.addArrangedSubview(beach)
		topStackView.addArrangedSubview(beachRating)
		bottomStackView.addArrangedSubview(restaurant)
		bottomStackView.addArrangedSubview(restaurantRating)
		bottomStackView.addArrangedSubview(bar)
		bottomStackView.addArrangedSubview(barRating)
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			
			topStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
			topStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
			topStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
			topStackView.heightAnchor.constraint(equalTo: bottomStackView.heightAnchor),
			
			bottomStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
			bottomStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
			bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 12),
			bottomStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),
			
			contentView.heightAnchor.constraint(equalToConstant: 200)
		])
	}
}
