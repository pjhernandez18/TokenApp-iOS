//
//  TokenCameraViewController.swift
//  AVCam
//
//  Created by P. J. Hernandez on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TokenCameraViewController: CameraViewController {
    
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        _previewView = previewView
        toggleCaptureMode()
        super.viewDidLoad()
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

