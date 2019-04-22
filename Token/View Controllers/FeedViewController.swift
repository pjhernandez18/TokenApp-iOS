//
//  FeedViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import LBTAComponents

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        collectionView?.backgroundColor = .white
        // register cell class
        collectionView?.register(TripCell.self, forCellWithReuseIdentifier: "cellId")
        
     }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    
    
    // returns the number of cells in the view controller
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    // dequeue a cell with a unique identifi
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class TripCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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

    
    func setupViews() {
        tripHighlights.delegate = self
        tripHighlights.dataSource = self
        
        tripHighlights.register(HighlightsCell.self, forCellWithReuseIdentifier: highlightsCellId)
        //  addSubview(feedtripImageView)
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
        tripHighlights.anchor(profileImageView.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
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
        return 1
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

class HighlightsCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension UIView {
//    func addConstraintsWithFormat(format: String, views: UIView...) {
//        var viewsDictionary = [String: UIView]()
//        for(index, view) in views.enumerated() {
//            let key = "v\(index)"
//            view.translatesAutoresizingMaskIntoConstraints = false
//            viewsDictionary[key] = view
//        }
//          addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
//    }


