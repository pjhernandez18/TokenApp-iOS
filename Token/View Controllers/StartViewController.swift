//
//  StartViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import paper_onboarding


class StartViewController: UIViewController {
   
    @IBOutlet weak var welcomeView: WelcomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeView.dataSource = self
        
        //tap gesture to segue to create trip
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        welcomeView.addGestureRecognizer(tapGesture)
        welcomeView.isUserInteractionEnabled = true
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tocreateTrip", sender: self)
    }
    
}

extension StartViewController: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 1
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundColor = UIColor.init(displayP3Red: 15/255, green: 170/255, blue: 190/255, alpha: 1)
        let titleFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        let descFont = UIFont(name: "AvenirNext-Regular", size: 15)!
        
        return OnboardingItemInfo(informationImage: UIImage(named: "Welcome-Token-Logo")!, title: "A Place For Your Memories", description: "Tap to Begin", pageIcon: UIImage(named: "Jar")!, color: backgroundColor, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descFont, descriptionLabelPadding: CGFloat(integerLiteral: 0),titleLabelPadding: CGFloat(integerLiteral: 0))
 
    }
}
 
