//
//  ProfileViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goLeft", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
