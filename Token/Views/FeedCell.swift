//
//  FeedCell.swift
//  Token
//
//  Created by P. J. Hernandez on 4/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import LBTAComponents

class FeedCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
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
    
    let tripHighlights: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let highlightsCellId = "highlightsCellId"
    
    
    //    let feedtripImageView: UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.backgroundColor = UIColor.gray
    //        imageView.image = UIImage(named: "barca_bunkers_view")
    //        imageView.contentMode = .scaleAspectFill
    //        imageView.clipsToBounds = true
    //        return imageView
    //    }()
    //
    //    let userProfileImageView: UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.backgroundColor = UIColor.white
    //        imageView.image = UIImage(named: "pj")
    //        imageView.layer.cornerRadius = 22
    //        imageView.layer.masksToBounds = true
    //        // imageView.layer.
    //
    //        return imageView
    //    }()
    //
    //    let separatorView: UIView = {
    //        let view = UIView()
    //        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    //        return view
    //    }()
    //
    //    let tripLabel: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.text = "Spring Break - BARCELONA BABY"
    //        return label
    //    }()
    //
    //    let tripDates: UITextView = {
    //        let textview = UITextView()
    //        textview.translatesAutoresizingMaskIntoConstraints = false
    //        textview.text = "March 10 - March 17"
    //        textview.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
    //        textview.textColor = UIColor.lightGray
    //
    //        return textview
    //    }()
    
    func setupViews() {
        //  addSubview(feedtripImageView)
        tripHighlights.delegate = self
        tripHighlights.dataSource = self
        
        tripHighlights.register(HighlightsCell.self, forCellWithReuseIdentifier: highlightsCellId)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(tripHighlights)
        //        addSubview(separatorView)
        //        addSubview(userProfileImageView)
        //        addSubview(tripLabel)
        //        addSubview(tripDates)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        tripHighlights.anchor(profileImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //        //addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: feedtripImageView)
        //        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        //        // vertiacal contraints
        //        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: feedtripImageView, userProfileImageView, separatorView)
        //        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        //
        //        //top constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .top, relatedBy: .equal, toItem: feedtripImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //        //left constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //
        //        //right constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .right, relatedBy: .equal, toItem: feedtripImageView , attribute: .right, multiplier: 1, constant: 0))
        //        //top constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        //
        //        //top constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .top, relatedBy: .equal, toItem: tripLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //        //left constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //
        //        //right constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .right, relatedBy: .equal, toItem: feedtripImageView , attribute: .right, multiplier: 1, constant: 0))
        //        //height constraints for title label
        //        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        //
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: highlightsCellId, for: indexPath) as! HighlightsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / 3), height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
  
}
//class HighlightsCell: UICollectionViewCell {
//    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        backgroundColor = .white
//    }
// 
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
