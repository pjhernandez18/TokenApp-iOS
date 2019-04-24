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
		navigationController?.navigationBar.barTintColor = .tokenYellow
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
		tableView.register(RecommendationCell.self, forCellReuseIdentifier: "RecommendationCell")
		tableView.register(MapTableViewCell.self, forCellReuseIdentifier: "MapTableViewCell")
		tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
	}
	
	// MARK: Table View
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section < 2 {
			return 1
		} else {
			return 3
		}
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
			
			cell.collectionView.tag = indexPath.row
			
			return cell
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section < 2 {
			return UITableView.automaticDimension
		} else {
			let imageCount = indexPath.row == 0 ? newImages.count : defaultImages[indexPath.row - 1].count
			let rows: CGFloat = ceil(CGFloat(imageCount) / CGFloat(3))
			return rows * assetSize.height + rows * 2
		}
	}
	
	// MARK: Collection View
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView.tag == 0 {
			return newImages.count
		} else {
			return 5
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
		
		cell.backgroundColor = .red
		
		cell.imageView.contentMode = .scaleAspectFill
		
		if collectionView.tag == 0 {
			cell.imageView.image = newImages[indexPath.row]
		} else {
			cell.imageView.image = UIImage(named: defaultImages[collectionView.tag - 1][indexPath.row])
		}
		
		return cell
	}
}
