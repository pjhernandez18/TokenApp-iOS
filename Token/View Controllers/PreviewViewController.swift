//
//  PreviewViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

enum PreviewMedia {
	case image(UIImage)
	case video(URL)
}

class PreviewViewController: UIViewController {
	let media: PreviewMedia
	
	init(media: PreviewMedia) {
		self.media = media
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
