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
	
	let trips: CollectionReference
	let events: CollectionReference
	
	init(db: Firestore) {
		self.db = db
		
		self.trips = db.collection("trips")
		self.events = db.collection("events")
	}
	
	func trips(userId: String, completion: @escaping ([Trip]?, Error?) -> Void) {
		trips
			.whereField("creator", isEqualTo: db.collection("users").document(userId))
//			.whereField("collaborators", arrayContains: db.collection("users").document(userId))
			.getDocuments { (snapshot, error) in
				if let error = error {
					DispatchQueue.main.async {
						completion(nil, error)
					}
				} else if let snapshot = snapshot {
					let trips = snapshot.documents.compactMap({ Trip(id: $0.documentID, data: $0.data()) })
					DispatchQueue.main.async {
						completion(trips, nil)
					}
				} else {
					DispatchQueue.main.async {
						completion(nil, nil)
					}
				}
			}
	}
	
	func events(tripId: String, completion: @escaping ([Event]?, Error?) -> Void) {
		events
			.whereField("trip", isEqualTo: db.collection("trips").document(tripId))
			.getDocuments { (snapshot, error) in
				if let error = error {
					DispatchQueue.main.async {
						completion(nil, error)
					}
				} else if let snapshot = snapshot {
					let events = snapshot.documents.compactMap({ Event(id: $0.documentID, data: $0.data()) })
					DispatchQueue.main.async {
						completion(events, nil)
					}
				} else {
					DispatchQueue.main.async {
						completion(nil, nil)
					}
				}
			}
	}
}
