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
import AVFoundation
import AVKit

class TokenCameraViewController: CameraViewController, UploadRecordingDelegate {
    
    
    var avPlayer: AVPlayer?
    var avPlayerController = AVPlayerViewController()
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
         delegate = self
        _previewView = previewView
        toggleCaptureMode()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {

      //    performSegue(withIdentifier: "ToLoginScreen", sender: nil)
        guard Auth.auth().currentUser != nil else {
            //grabs the current auth session and see if they're logged in
            //load login screen
            //performSegue(withIdentifier: "ToLoginScreen", sender: nil)
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
    
    @IBAction func downloadSnap(_ sender: Any) {
        
        print("downloading snap")
        
        //playVideo()
        downloadVideo()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //need to change to TripsVC later
        if let userVC = segue.destination as? UsersViewController {
            
            if let videoDictionary = sender as? Dictionary<String, URL>{
                let url = videoDictionary["videoURL"]
                userVC.videoURL = url
            }
        }
    }
    
    // function that immediately segueways to users vc after recording has stopped
    func recordingComplete(_ videoURL: URL!) {
        
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL": videoURL])
    }
    
    func playVideo(url: NSURL){
        
        //let fileURL = NSURL(string: "http://www.ebookfrenzy.com/ios_book/movie.mov")!
        avPlayer = AVPlayer(url: url as URL)
        
        self.avPlayerController.player = avPlayer
        self.addChild(avPlayerController)
        self.view.addSubview(avPlayerController.view)
        self.avPlayerController.view.frame = self.view.frame
        
        avPlayer?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(TokenCameraViewController.playerDidFinish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer!.currentItem)
        
    }
    
    @objc func playerDidFinish() {
        self.dismiss(animated: true, completion: nil)
        avPlayerController.view.removeFromSuperview()
        NotificationCenter.default.removeObserver(self)
        
    }
    
    func downloadVideo() {
        let videoName = "videos/EE360C3E-D1A3-484B-9624-D85AC70CA044file:/private/var/mobile/Containers/Data/Application/1DFC767B-84C0-4BD2-ADC5-CFC5F7E01825/tmp/42DD8DFC-EFE4-4E00-9358-F4549DF3FBB7.mov"
        let videoURL = DatabaseService.instance.storageRef.child(videoName)
        
        videoURL.downloadURL(completion: { (url, error) in
            
            if error != nil {
                 print(error?.localizedDescription)
                 print("returning")
                 return
            }
            print(videoURL)
            // self.playVideo()
            // Otherwise, you can start downloading the file you want
            Storage.storage().reference(forURL: String(describing: videoURL)).getMetadata { (metadata, error) in
                if error != nil {
                    print("error getting metadata")
                } else {
                    videoURL.downloadURL { (url, error) in
                        guard let downloadUrl = url else {
                            print("trouble getting the download url")
                            return
                        }
                        print(downloadUrl)
                        
                        if downloadUrl != nil {
                            print("download url had been obtained and set")
                            self.playVideo(url: downloadUrl as! NSURL)
                        }
                    }
            }
            
        }
    })
}
}
