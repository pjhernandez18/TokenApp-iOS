//
//  FeedViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        navigationItem.title = "Feed"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(TripCell.self, forCellWithReuseIdentifier: "cellId")
        
     }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width , height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

class TripCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let feedtripImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        imageView.image = UIImage(named: "barca_bunkers_view")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "pj")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        // imageView.layer.

        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let tripLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spring Break - BARCELONA BABY"
        return label
    }()
    
    let tripDates: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.text = "March 10 - March 17"
        textview.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textview.textColor = UIColor.lightGray

        return textview
    }()
    
    func setupViews() {
        addSubview(feedtripImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(tripLabel)
        addSubview(tripDates)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: feedtripImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        // vertiacal contraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: feedtripImageView, userProfileImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //top constraints for title label
        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .top, relatedBy: .equal, toItem: feedtripImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraints for title label
        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraints for title label
        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .right, relatedBy: .equal, toItem: feedtripImageView , attribute: .right, multiplier: 1, constant: 0))
        //top constraints for title label
        addConstraint(NSLayoutConstraint(item: tripLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraints for title label
        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .top, relatedBy: .equal, toItem: tripLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraints for title label
        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraints for title label
        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .right, relatedBy: .equal, toItem: feedtripImageView , attribute: .right, multiplier: 1, constant: 0))
        //height constraints for title label
        addConstraint(NSLayoutConstraint(item: tripDates, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
          addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

