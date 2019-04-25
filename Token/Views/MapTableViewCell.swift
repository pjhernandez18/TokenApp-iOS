//
//  MapTableViewCell.swift
//  token
//
//  Created by Jason Silberman on 8/8/18.
//  Copyright © 2018 Jason Silberman. All rights reserved.
//

import UIKit
import MapKit

final class MapTableViewCell: UITableViewCell, MKMapViewDelegate {
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
		
		map.delegate = self
		
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
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		if (annotation is MKUserLocation) {
			return nil
		}
		
		let reuseId = "pin"
		let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
		
		if let annotation = annotation as? LocationAnnotation {
			if annotation.name == "LavaLab" {
				view.markerTintColor = UIColor(hue:0.07, saturation:0.79, brightness:0.86, alpha:1.00)
			} else {
				view.markerTintColor = .tokenBlue
			}
		}
		
		return view
	}
}
