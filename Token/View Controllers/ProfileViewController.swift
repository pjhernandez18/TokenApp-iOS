//
//  ProfileViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	var newImages: [UIImage] = [] {
		didSet {
			collectionView.reloadData()
		}
	}
	
	let defaultImages: [[String]] = [["token1", "token2", "token3", "token4", "token5"], ["token6", "token7", "token8", "token9", "token10"]]
	
	weak var pageViewController: PageViewController?
	
	var assetSize: CGSize = .zero
	
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
		collectionView?.register(TokenFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TokenFooter")
		collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
		
		navigationItem.title = "Current Trip"
		navigationController?.navigationBar.barTintColor = .tokenBlue
		navigationController?.navigationBar.tintColor = .white
		navigationController?.navigationBar.barStyle = .black
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cameraIcon"), style: .plain, target: self, action: #selector(goToCamera))
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
		assetSize = flowLayout.itemSize
		
		flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 40)
		flowLayout.sectionHeadersPinToVisibleBounds = true
	}
	
	@objc func goToCamera() {
		pageViewController?.prev()
	}
	
	@objc func endTrip() {
		let token = TokenViewController(newImages: newImages, assetSize: assetSize, style: .token)
		
		present(UINavigationController(rootViewController: token), animated: true, completion: nil)
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
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
		
		cell.backgroundColor = .red
		
		cell.imageView.contentMode = .scaleAspectFill
		
		if indexPath.section == 0 {
			cell.imageView.image = newImages[indexPath.row]
		} else {
			cell.imageView.image = UIImage(named: defaultImages[indexPath.section - 1][indexPath.row])
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		if kind == UICollectionView.elementKindSectionHeader {
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TokenHeader", for: indexPath) as! TokenHeader
			
			switch indexPath.section {
			case 0:
				header.label.text = "Today"
			case 1:
				header.label.text = "1 day ago"
			case 2:
				header.label.text = "2 days ago (Camera Roll)"
			default:
				break
			}
			
			return header
		} else { // footer
			let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TokenFooter", for: indexPath) as! TokenFooter
			
			footer.button.setTitle("End Trip!", for: .normal)
			footer.button.addTarget(self, action: #selector(endTrip), for: .touchUpInside)
			
			return footer
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		if section == 2 {
			return CGSize(width: view.bounds.width, height: 120)
		} else {
			return .zero
		}
	}

}
