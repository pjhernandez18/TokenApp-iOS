//
//  PreviewViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PreviewPhotoViewController: PreviewViewController {
	let media: UIImage
	
	let imageView: UIImageView
	
	init(media: UIImage) {
		self.media = media
		self.imageView = UIImageView(image: media)
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		imageView.contentMode = .scaleAspectFill
		previewView.addSubview(imageView)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		imageView.frame = previewView.bounds
	}
	
	override func add() {
		profileViewController?.newImages.insert(media, at: 0)
		close()
	}
}
