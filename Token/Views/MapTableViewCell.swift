//
//  MapTableViewCell.swift
//  token
//
//  Created by Jason Silberman on 8/8/18.
//  Copyright © 2018 Jason Silberman. All rights reserved.
//

import UIKit
import MapKit

final class MapTableViewCell: UITableViewCell {
	let map = MKMapView(frame: .zero)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func centerMapOnLocation(location: CLLocation, radius: CLLocationDistance = 1000) {
		let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
		map.setRegion(coordinateRegion, animated: true)
	}
	
	private func setup() {
		backgroundColor = .clear
		
		map.translatesAutoresizingMaskIntoConstraints = false
		map.layer.cornerRadius = 4
		map.layer.masksToBounds = true
		contentView.addSubview(map)
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			map.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			map.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			map.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			map.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			
			map.heightAnchor.constraint(greaterThanOrEqualToConstant: 250)
		])
	}
}
