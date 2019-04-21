//
//  PreviewVideoViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class PreviewVideoViewController: UIViewController {
	let media: URL
	
	let player: AVPlayer
	let playerController : AVPlayerViewController
	
	init(media: URL) {
		self.media = media
		self.player = AVPlayer(url: media)
		self.playerController = AVPlayerViewController()
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		playerController.showsPlaybackControls = false
		playerController.player = player
		addChild(playerController)
		view.addSubview(playerController.view)
		
		NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)

		
		// Allow background audio to continue to play
		do {
			if #available(iOS 10.0, *) {
				try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
			} else {
			}
		} catch let error as NSError {
			print(error)
		}
		
		// start playback
		
		do {
			try AVAudioSession.sharedInstance().setActive(true)
		} catch let error as NSError {
			print(error)
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		player.play()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		playerController.view.frame = view.bounds
	}
	
	@objc func cancel() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func playerItemDidReachEnd() {
		player.seek(to: CMTime.zero)
		player.play()
	}
}
