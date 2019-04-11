//
//  Trip.swift
//  TokenApp
//
//  Created by Jason Silberman on 4/10/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Trip {
	let id: String
	let name: String
	
	let start: Date
	let end: Date
	
	let autoload: Bool
	
	init?(id: String, data: [String: Any]) {
		guard let name = data["name"] as? String,
			let start = data["start"] as? Timestamp,
			let end = data["end"] as? Timestamp,
			let autoload = data["autoload"] as? Bool
		else {
			return nil
		}
		
		self.id = id
		self.name = name
		self.start = start.dateValue()
		self.end = end.dateValue()
		self.autoload = autoload
	}
}
