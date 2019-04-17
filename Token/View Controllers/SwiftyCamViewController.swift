//
//  SwiftyCamViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftyCam


class SwiftyCamViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let captureButton = SwiftyCamButton(frame: buttonFrame)
        captureButton.delegate = self
        cameraDelegate = self
        flashEnabled = true
        doubleTapCameraSwitch = true

    }
    

}
