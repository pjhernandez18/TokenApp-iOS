//
//  Feed2ViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import LBTAComponents

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, PageableViewController
{
   
    let headerView: UIView = {
        let hv = UIView()
        hv.backgroundColor = tokenBlue
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Feed"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // collection view to hold token stories
    let tokenFeed: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let highlightsID = "highlightsID"
    let usersID = "usersID"
    let profileArray = ["pj", "jason", "jake", "jerry", "pj", "jake", "jerry"]
    let storyArray = ["Story1", "Story2", "Story3", "Story4", "Story5", "Story6", "Story7"]
    let nameArray = ["PJ Hernandez", "Jason Silberman", "Jake Hooli", "Jerry Zhao", "PJ Hernandez", "Jake Hooli", "Jerry Zhao"]
    let timeStampArray = ["10 mins ago - in Barcelona, Spain",
                          "5 mins ago - in Hong Kong, Hong Kong",
                          "1 day ago - in London, United Kingdom",
                          "3 days ago - in Los Angeles, California",
                          "3 days ago - in Lisbon, Portugal",
                          "5 days ago - in Lake Arrowhead, California",
                          "1 week ago - in Santa Monica, California"]
    let usersContentArray = ["barcelona", "hongkong", "london", "losangeles", "portugal", "lakearrowhead", "santamonica"]
 
	func canPage() -> Bool {
		return true
	}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.addSubview(tokenFeed)
        view.backgroundColor = .white
        setupHeader()
        setupViews()
    }
    
    func setupHeader(){
        headerView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 60)
        headerView.addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 1/5).isActive = true
        headerLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, constant: 20).isActive = true
    }
    func setupViews() {
        tokenFeed.delegate = self
        tokenFeed.dataSource = self
        
        tokenFeed.register(HighlightsCell.self, forCellWithReuseIdentifier: highlightsID)
        tokenFeed.register(UsersCell.self, forCellWithReuseIdentifier: usersID)
        
        tokenFeed.anchor(headerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: highlightsID, for: indexPath) as! HighlightsCell
            cell.stories = storyArray
            cell.profiles = profileArray
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: usersID, for: indexPath) as! UsersCell
        cell.profiles = profileArray[indexPath.section - 1]
        cell.names = nameArray[indexPath.section - 1]
        cell.timestamp = timeStampArray[indexPath.section - 1]
        cell.picture = usersContentArray[indexPath.section - 1]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 250)
        }
    
        return CGSize(width: view.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
   
}

extension UIView {
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
    }
    
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                   paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
}
