//
//  UserCell.swift
//  Token
//
//  Created by P. J. Hernandez on 4/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class UsersCell: UICollectionViewCell{
    
    var profiles: String? {
        didSet {
            if let imageName = profiles {
                profileImageView.image = UIImage(named: imageName)
            }
        }
    }
    var names: String? {
        didSet {
            if let name = names {
                nameLabel.text = name
            }
        }
    }
    var timestamp: String? {
        didSet {
            if let ts = timestamp {
                timestampLabel.text = ts
            }
        }
    }
    var picture: String? {
        didSet {
            if let p = picture {
                travelContent.image = UIImage(named: p)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tokenBlue
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = { 
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    let travelContent: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "pj")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    func setupViews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(timestampLabel)
        addSubview(travelContent)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        timestampLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        travelContent.anchor(profileImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        
    }
    
}
