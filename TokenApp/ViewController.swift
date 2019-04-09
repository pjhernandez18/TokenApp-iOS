//
//  ViewController.swift
//  TokenApp
//
//  Created by P. J. Hernandez on 4/8/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func cameraButton_TouchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "showImage_Segue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

