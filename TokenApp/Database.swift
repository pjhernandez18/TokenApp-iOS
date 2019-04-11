//
//  Database.swift
//  TokenApp
//
//  Created by Jason Silberman on 4/10/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Database {
	let db: Firestore
	
	let collaborations: CollectionReference
	
	init(db: Firestore) {
		self.db = db
		
		self.collaborations = db.collection("collaborations")
	}
	
	func trips(userId: String, completion: (Any, Error) -> Void) {
		
	}
	
	func events(tripId: String, completion: (Any, Error) -> Void) {
		
	}
}
