//
//  TokenViewController.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
	var coordinate: CLLocationCoordinate2D {
		return location.coordinate
	}
	
	var title: String? {
		return name
	}
	
	let location: CLLocation
	let name: String
	
	init(location: CLLocation, name: String) {
		self.location = location
		self.name = name
	}
}

enum Style {
	case token, feed
}

class TokenViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	let newImages: [UIImage]
	
	var defaultImages: [[String]] {
		if style == .token {
			return [["token1", "token2", "token3", "token4", "token5"], ["token6", "token7", "token8", "token9", "token10"], ["token11", "token12", "token13", "token14", "token15"]]
		} else {
			return [["grid1", "grid2", "grid3", "grid4", "grid5"], ["grid6", "grid7", "grid8", "grid9", "grid10"]]
		}
	}
	
	let assetSize: CGSize
	
	var places: [(Double, Double, String)] = []
	
	let style: Style
	
	init(newImages: [UIImage], assetSize: CGSize, style: Style) {
		self.newImages = newImages
		self.assetSize = assetSize
		self.style = style
		
		super.init(style: .plain)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		navigationController?.navigationBar.barTintColor = .tokenYellow
		navigationController?.navigationBar.tintColor = .tokenBlue
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
		tableView.register(RecommendationCell.self, forCellReuseIdentifier: "RecommendationCell")
		tableView.register(MapTableViewCell.self, forCellReuseIdentifier: "MapTableViewCell")
		tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
		
		if style == .token {
			navigationItem.title = "Los Angeles"
			navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(close))
			places.append((34.0407, -118.2468, "LA Live"))
			places.append((34.0928, -118.3287, "Hollywood"))
			places.append((33.9850, -118.4695, "Beverly Hills"))
			places.append((34.0736, -118.4004, "Santa Monica"))
			places.append((34.0224, -118.2851, "LavaLab"))
		} else {
			navigationItem.title = "Spain"
			navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(close))
			places.append((41.3851, 2.1734, "Barcelona"))
			places.append((40.4168, -3.7038, "Madrid"))
			places.append((38.7223, -9.1393, "Lisbon"))
			places.append((39.4699, -0.3763, "Valencia"))
			places.append((37.3891, -5.9845, "Seville"))
		}
	}
	
	@objc func close() {
		dismiss(animated: true, completion: nil)
	}
	
	// MARK: Table View
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 3 + defaultImages.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationCell", for: indexPath) as! RecommendationCell
			
			cell.selectionStyle = .none
			
			return cell
		} else if indexPath.section == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
			
			cell.selectionStyle = .none
			
			let annotations = places.map { (loc) -> LocationAnnotation in
				return LocationAnnotation(location: CLLocation(latitude: loc.0, longitude: loc.1), name: loc.2)
			}
			
			cell.map.showAnnotations(annotations, animated: true)
			
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
			
			cell.selectionStyle = .none
			
			cell.assetSize = assetSize
			
			cell.collectionView.dataSource = self
			cell.collectionView.delegate = self
			
			cell.collectionView.tag = indexPath.section
			
			return cell
		}
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Highlights"
		case 1:
			return "Your Places"
		case 2:
			return newImages.count != 0 ? "Today" : nil
		case 3:
			return "1 day ago"
		case 4:
			return "2 days ago"
		case 5:
			return "3 days ago"
		default:
			return nil
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section < 2 {
			return UITableView.automaticDimension
		} else {
			let imageCount = indexPath.section == 2 ? newImages.count : defaultImages[indexPath.section - 3].count
			let rows: CGFloat = ceil(CGFloat(imageCount) / CGFloat(3))
			return rows * assetSize.height + rows * 2
		}
	}
	
	// MARK: Collection View
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView.tag == 2 {
			return newImages.count
		} else {
			return 5
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
		
		cell.backgroundColor = .red
		
		cell.imageView.contentMode = .scaleAspectFill
		
		if collectionView.tag == 2 {
			cell.imageView.image = newImages[indexPath.row]
		} else {
			cell.imageView.image = UIImage(named: defaultImages[collectionView.tag - 3][indexPath.row])
		}
		
		return cell
	}
}
