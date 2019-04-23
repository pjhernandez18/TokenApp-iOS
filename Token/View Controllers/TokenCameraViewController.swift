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

class TokenCameraViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate, PageableViewController {
	
	let feedButton = UIButton(frame: .zero)
	let captureButton = SwiftyRecordButton(frame: .zero)
	let profileButton = UIButton(frame: .zero)
	
	override func viewDidLoad() {
		videoGravity = .resizeAspectFill
		
		cameraDelegate = self
		
		swipeToZoom = false
		
		// bottom bar buttons
		
		feedButton.setImage(UIImage(named: "Feed Icon-2"), for: .normal)
		feedButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(feedButton)
		
		captureButton.translatesAutoresizingMaskIntoConstraints = false
		captureButton.delegate = self
		view.addSubview(captureButton)
		
		profileButton.setImage(UIImage(named: "Jar Icon-1"), for: .normal)
		profileButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(profileButton)
		
		// setup view hierarchy
		
		super.viewDidLoad()
		
		panGesture?.isEnabled = false
		
		view.setNeedsUpdateConstraints()
	}
	
	func goToFeed() {
		
	}
	
	func goToProfile() {
		
	}
	
	func canPage() -> Bool {
		return true
	}
	
	override func updateViewConstraints() {
		super.updateViewConstraints()
		
		NSLayoutConstraint.activate([
			captureButton.widthAnchor.constraint(equalToConstant: 80),
			captureButton.heightAnchor.constraint(equalToConstant: 80),
			captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			captureButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
			
			feedButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 5),
			feedButton.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor),
			feedButton.widthAnchor.constraint(equalToConstant: 80),
			feedButton.heightAnchor.constraint(equalToConstant: 80),
			
			profileButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -5),
			profileButton.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor),
			profileButton.widthAnchor.constraint(equalToConstant: 80),
			profileButton.heightAnchor.constraint(equalToConstant: 80),
		])
	}
	
	// MARK: Delegate
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
		captureButton.growButton()
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
		captureButton.shrinkButton()
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
		present(PreviewPhotoViewController(media: photo), animated: true, completion: nil)
	}
	
	func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
		present(PreviewVideoViewController(media: url), animated: true, completion: nil)
	}
}
