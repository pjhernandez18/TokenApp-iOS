//
//  TokenViewController.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TokenViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	let newImages: [UIImage]
	
	let defaultImages: [[String]] = [["grid1", "grid2", "grid3", "grid4", "grid5"], ["grid6", "grid7", "grid8", "grid9", "grid10"]]
	
	let assetSize: CGSize
	
	init(newImages: [UIImage], assetSize: CGSize) {
		self.newImages = newImages
		self.assetSize = assetSize
		
		super.init(style: .plain)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "yOuR ToKEN"
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
		navigationController?.navigationBar.barTintColor = .tokenYellow
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
		tableView.register(RecommendationCell.self, forCellReuseIdentifier: "RecommendationCell")
		tableView.register(MapTableViewCell.self, forCellReuseIdentifier: "MapTableViewCell")
		tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
	}
	
	@objc func close() {
		dismiss(animated: true, completion: nil)
	}
	
	// MARK: Table View
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 5
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationCell", for: indexPath) as! RecommendationCell
			
			return cell
		} else if indexPath.section == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
			
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
			
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
