//
//  TokenCameraViewController.swift
//  AVCam
//
//  Created by P. J. Hernandez on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import SwiftyCam

class TokenCameraViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
	
	let captureButton: SwiftyRecordButton
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		let buttonFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
		captureButton = SwiftyRecordButton(frame: buttonFrame)
		
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		let buttonFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
		captureButton = SwiftyRecordButton(frame: buttonFrame)
		
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		videoGravity = .resizeAspectFill
		
		cameraDelegate = self
		
		captureButton.center = view.center
		captureButton.delegate = self
		
		view.addSubview(captureButton)
		
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		print(captureButton.frame)
	}
	
	// MARK: Delegate
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
		print("Did Begin Recording")
		captureButton.growButton()
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
		print("Did finish Recording")
		captureButton.shrinkButton()
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
		print("took photo")
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
		print("done with video")
	}
}
