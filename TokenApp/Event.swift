//
//  Event.swift
//  TokenApp
//
//  Created by Jason Silberman on 4/10/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Event {
	let id: String
	
	let description: String
	
	let date: Date
	
	let location: GeoPoint
	
	let photoCount: Int
	
	let photos: [Photo]? = nil
	
	init?(id: String, data: [String: Any]) {
		guard let description = data["description"] as? String,
			let date = data["date"] as? Timestamp,
			let location = data["location"] as? GeoPoint,
			let photoCount = data["photoCount"] as? Int
//			let photos = data["photos"] as? [String: Any]
			else {
				return nil
			}
		
		self.id = id
		self.description = description
		self.date = date.dateValue()
		self.location = location
		self.photoCount = photoCount
//		self.photos = photos.map
	}
}
