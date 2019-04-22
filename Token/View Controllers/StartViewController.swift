//
//  StartViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import LBTAComponents

class StartViewController: UIViewController {
   
    let tokenLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo-Shadow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let tokenName: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Token-Shadow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "A Place, Your Memories"
        label.textColor = .white
        label.font = UIFont(name: "AvenirNext-Regular", size: 18)!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let jarLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "START YOUR JOURNEY"
        label.textColor = .white
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.dataSource = self
        //tap gesture to segue to create trip
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        view.backgroundColor = tokenBlue
        
        view.addSubview(tokenLogo)
        view.addSubview(tokenName)
        view.addSubview(captionLabel)
        view.addSubview(jarLogo)
        view.addSubview(startLabel)

        setupViews()
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tocreateTrip", sender: self)
    }
    
    func setupViews() {
        tokenLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tokenLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        tokenLogo.widthAnchor.constraint(equalToConstant: 180).isActive = true
        tokenLogo.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        tokenName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tokenName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tokenName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -35).isActive = true
        tokenName.heightAnchor.constraint(equalToConstant: 80).isActive = true

        captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        captionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        captionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        captionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        jarLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jarLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230).isActive = true
        jarLogo.widthAnchor.constraint(equalToConstant: 95).isActive = true
        jarLogo.heightAnchor.constraint(equalToConstant: 95).isActive = true
        
        startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 300).isActive = true
        startLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        startLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
    }
    
}

