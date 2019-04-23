//
//  HighlightsCell.swift
//  Token
//
//  Created by P. J. Hernandez on 4/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HighlightsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var stories: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    var profiles: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    var labels: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = -30
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = tokenBlue
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(collectionView)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoryCell
       
        if let story = stories?[indexPath.item] {
            cell.imageView.image = UIImage(named: story)
        }
        if let profile = profiles?[indexPath.item] {
            cell.profileImageView.image = UIImage(named: profile)
        }
        if let label = labels?[indexPath.item] {
            cell.storyLabel.text = label
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private class StoryCell: UICollectionViewCell {
        
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderWidth = 2
            imageView.layer.masksToBounds = false
            imageView.layer.borderColor = UIColor.tokenYellow.cgColor
            imageView.layer.cornerRadius = 25
            imageView.clipsToBounds = true
            return imageView
        }()
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 15
            //iv.alpha = 0.7
            return iv
        }()
        
        let storyLabel: UILabel = {
            let label = UILabel()
            //label.text = "Add to Token"
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.textColor = .white
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        func setup() {
            setCellShadow()
            //addSubview(profileImageView)
            addSubview(imageView)
            addSubview(storyLabel)
            imageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 230)
//            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
            imageView.addSubview(profileImageView)
            profileImageView.anchor(imageView.topAnchor, left: imageView.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
            storyLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 10, rightConstant: 0, widthConstant: imageView.frame.width, heightConstant: 20)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
}
