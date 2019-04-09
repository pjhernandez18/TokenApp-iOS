//
//  PhotoVideoControllerViewController.swift
//  TokenApp
//
//  Created by P. J. Hernandez on 4/9/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {

    var takenSnap:UIImage?
    
    @IBOutlet weak var snapView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let availableSnap = takenSnap {
            snapView.image = availableSnap
        }
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
