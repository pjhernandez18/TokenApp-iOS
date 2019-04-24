//
//  PhotosTableViewCell.swift
//  Token
//
//  Created by Jason Silberman on 4/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
	let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
	
	var assetSize: CGSize = .zero {
		didSet {
			let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
			layout?.itemSize = assetSize
		}
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupHierarchy()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupHierarchy() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .white
		collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
		
//		collectionView.scrollIndicatorInsets = collectionView.contentInset
		let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
		layout?.minimumInteritemSpacing = 2
		layout?.minimumLineSpacing = 2
		contentView.addSubview(collectionView)
		
		setNeedsUpdateConstraints()
	}
	
	override func updateConstraints() {
		super.updateConstraints()
		
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
	}
}
