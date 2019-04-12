//
//  TokenCameraViewController.swift
//  AVCam
//
//  Created by P. J. Hernandez on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth

class TokenCameraViewController: CameraViewController {
    
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        _previewView = previewView
        toggleCaptureMode()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       //  performSegue(withIdentifier: "ToLoginScreen", sender: nil)
        guard Auth.auth().currentUser != nil else {
            //grabs the current auth session and see if they're logged in

//            //load login screen
           performSegue(withIdentifier: "ToLoginScreen", sender: nil)
//
            return
        }
    }
  
    @IBAction func recordButtonPressed(_ sender: Any) {
        print("record button pressed")
        toggleMovieRecording()
    }
  
    @IBAction func changeCameraPressed(_ sender: Any) {
        print("change camera button pressed")
        changeCamera()
    }
    
  
}

