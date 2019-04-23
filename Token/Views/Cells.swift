//
//  Cells.swift
//  Token
//
//  Created by P. J. Hernandez on 4/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import LBTAComponents

let tokenBlue = UIColor(r: 15, g: 170, b: 190)

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "FOLLOW SUGGESTIONS"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        backgroundColor = UIColor(r: 15, g: 170, b: 190)
    }
}

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = tokenBlue
        return label
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
         textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        
        
        
    }
}
class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
        //  nameLabel.text = datasourceItem as? String
      //      profileImageView.image = datasourceItem as? UIImage
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pj")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "PJ Hernandez"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }() 
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@pjgoesonvacation"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(r: 130, g: 130, b: 130)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textview = UITextView()
        textview.text = "f;esjnfsofnsofnsafjasnf[osafnsa'ofjnsa'ofjnsaofjasnf'oasjfnasf'ojn"
        textview.font = UIFont.systemFont(ofSize: 15)
        textview.backgroundColor = .clear
        return textview
    }()
    
    let followButton: UIButton = {
        let button = UIButton()

        button.layer.cornerRadius = 5
        button.layer.borderColor = tokenBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(tokenBlue, for: .normal)
        //button.setImage(UIImage(named: "Add"), for: .normal)
        //button.imageView?.contentMode = .scaleAspectFit
        //button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    

    override func setupViews() {
        super.setupViews()
    
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)

        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34 )
    }
}
