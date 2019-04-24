//
//  ProfileViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController {
	var newImages: [UIImage] = [] {
		didSet {
			collectionView.reloadData()
		}
	}
	
	var defaultImages: [[UIImage]] = []
	
	weak var pageViewController: PageViewController?
	
	init() {
		super.init(collectionViewLayout: UICollectionViewFlowLayout())
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView?.backgroundColor = .white
		collectionView?.alwaysBounceVertical = true
		
		collectionView?.register(TokenHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TokenHeader")
		
		navigationItem.title = "Your Profile"
		navigationController?.navigationBar.barTintColor = .tokenBlue
		navigationController?.navigationBar.tintColor = .white
		navigationController?.navigationBar.barStyle = .black
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cameraIcon"), style: .plain, target: self, action: #selector(goToCamera))
		
		collectionView.register(TokenCell.self, forCellWithReuseIdentifier: "TokenCell")
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
				
		let numberOfItems: CGFloat = 3
		let spacing: CGFloat = 1
		let paddedSpace = (numberOfItems + 1) * spacing
		
		flowLayout.minimumInteritemSpacing = spacing
		flowLayout.minimumLineSpacing = spacing
		
		let demension: CGFloat = (view.bounds.width - paddedSpace) / numberOfItems
		flowLayout.itemSize = CGSize(width: demension, height: demension)
		
		flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 40)
	}
	
	@objc func goToCamera() {
		pageViewController?.prev()
	}
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 0 {
			return newImages.count
		} else {
			return 5
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TokenCell", for: indexPath) as! TokenCell
		
		cell.backgroundColor = .red
		
		cell.imageView.contentMode = .scaleAspectFill
		
		if (indexPath.section == 0) {
			cell.imageView.image = newImages[indexPath.row]
		} else {
//			cell.imageView.image = defaultImages[indexPath.section][indexPath.row]
			cell.imageView.image = nil
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TokenHeader", for: indexPath) as! TokenHeader

		switch indexPath.section {
		case 0:
			header.label.text = "Today"
		case 1:
			header.label.text = "1 day ago"
		case 2:
			header.label.text = "2 days ago"
		default:
			break
		}
		
		return header
	}

}
