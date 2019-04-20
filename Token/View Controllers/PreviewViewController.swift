//
//  PreviewViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var ImageEdit: UIImageView!
    
     var capturedPhoto :UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageEdit.image = capturedPhoto
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ImageEdit.image = capturedPhoto
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ImageEdit.image = capturedPhoto
    }
    
    
    
    

}
