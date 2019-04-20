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


// View controller for the main in-app camera

class TokenCameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    var avPlayer: AVPlayer?
    var avPlayerController = AVPlayerViewController()
    
    var usingSimulator: Bool = true
    var captureSession : AVCaptureSession?
    var backCamera : AVCaptureDevice?
    var frontCamera : AVCaptureDevice?
    var currentDevice : AVCaptureDevice?
    var captureDeviceInputBack:AVCaptureDeviceInput?
    var captureDeviceInputFront:AVCaptureDeviceInput?
    var stillImageOutput: AVCaptureStillImageOutput?
    var cameraFacingback: Bool = true
    var ImageCaptured: UIImage?
    var cameraState:Bool = true
    var flashOn:Bool = false
    var cameraOutput = AVCapturePhotoOutput()

    /*
     The outlet of UIView of the CameraView
     */
    
    @IBOutlet var previewView: UIView!
    
    @IBOutlet weak var captureButton: UIButton!
    
    @IBOutlet weak var flipCameraButton: UIButton!
    

    override func viewDidLoad() {
//         delegate = self
//        _previewView = previewView
       
        // toggleCaptureMode()
        super.viewDidLoad()
         loadCamera()
        // Swipe gestures for navigation. Right swipe to go to feed, left swipe to go to trip jar
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionRight(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionLeft(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
    }
    // functions to handle swiping
    @objc func swipeActionRight(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goLeft", sender: self)
    }
    @objc func swipeActionLeft(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
         // performSegue(withIdentifier: "ToLoginScreen", sender: nil)
        guard Auth.auth().currentUser != nil else {
            //grabs the current auth session and see if they're logged in
            //load login screen
            performSegue(withIdentifier: "ToLoginScreen", sender: nil)
            return
        }
    }
    
//    func checkIfUserIsOnTrip() {
//
//        // TODO
//    }
  // Buttons
    @IBAction func recordButtonPressed(_ sender: Any) {
        print("record button pressed")
        // if user taps button, then it should be a photo
        // takePicture()
        // if user holds the button, then it should be a video recording
        //toggleMovieRecording()
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                             kCVPixelBufferWidthKey as String: 160,
                             kCVPixelBufferHeightKey as String: 160]
        settings.previewPhotoFormat = previewFormat
        self.cameraOutput.capturePhoto(with: settings, delegate: self)
        
        
        
        
    }
    @IBAction func changeCameraPressed(_ sender: Any) {
        print("change camera button pressed")
        //changeCamera()
    }
    @IBAction func feedViewPressed(_ sender: Any) {
        print("feed view button pressed")
        performSegue(withIdentifier: "toFeedViewController", sender: nil)
    }
    
    func loadCamera() {
        captureSession = AVCaptureSession()
        captureSession?.startRunning()
        
        if (captureSession?.canSetSessionPreset(AVCaptureSession.Preset.high))!{
            captureSession?.sessionPreset = AVCaptureSession.Preset.photo
        }
        let devices = AVCaptureDevice.devices()
        
        for device in devices {
            if (device as AnyObject).hasMediaType(AVMediaType.video){
                if (device as AnyObject).position == AVCaptureDevice.Position.back {
                    backCamera = device as! AVCaptureDevice
                }
                else if (device as AnyObject).position == AVCaptureDevice.Position.front{
                    frontCamera = device as! AVCaptureDevice
                }
            }
        }
        if backCamera == nil {
            print("no back camera")
        }
        currentDevice = backCamera
       // configureFlash()
        
        // create a capture device input object file from the back and front camera
        do {
            captureDeviceInputBack = try AVCaptureDeviceInput(device: backCamera!)
        } catch {
            
        }
        do {
            captureDeviceInputFront = try AVCaptureDeviceInput(device: frontCamera!)
        } catch {
            
        }
        
        if(captureSession?.canAddInput(captureDeviceInputBack!))!{
            captureSession?.addInput(captureDeviceInputBack!)
        }else {
            print("can't add input")
        }
        stillImageOutput = AVCaptureStillImageOutput()
        
        let capturePreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)

        capturePreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        capturePreviewLayer.frame = self.view.frame
        capturePreviewLayer.bounds = self.view.bounds
        previewView.layer.addSublayer(capturePreviewLayer)
    
    }
    
    func takePicture() {
        captureButton.isEnabled = true
        cameraState = false
        if !captureSession!.isRunning {
            return
        }
        
        if let videoConnection = stillImageOutput!.connection(with: AVMediaType.video){
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {(sampleBuffer,error) -> Void in
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider = CGDataProvider(data: imageData as! CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    self.ImageCaptured = UIImage(cgImage:cgImageRef!, scale: 1.0, orientation: UIImage.Orientation.right)
                    //self.captureSession.stopRunning()
                    self.performSegue(withIdentifier: "toPreview", sender: self)}
            })
        }
        print("here")
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        //need to change to Preview View Controller
//        if let userVC = segue.destination as? Users {
//
//            if let videoDictionary = sender as? Dictionary<String, URL>{
//                let url = videoDictionary["videoURL"]
//                userVC.videoURL = url
//            }
//        }
//    }
//
     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toPreview"{
            let previewVC = segue.destination as! PreviewViewController
            previewVC.capturedPhoto = self.ImageCaptured
        }
    }
    
    // function that immediately segueways to users vc after recording has stopped
    func recordingComplete(_ videoURL: URL!) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL": videoURL])
    }
    
    func playVideo(url: NSURL){
        
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
    // function to download video from Firebase storage
    
//    func downloadVideo() {
//        // random video file
//        let videoName = "videos/EE360C3E-D1A3-484B-9624-D85AC70CA044file:/private/var/mobile/Containers/Data/Application/1DFC767B-84C0-4BD2-ADC5-CFC5F7E01825/tmp/42DD8DFC-EFE4-4E00-9358-F4549DF3FBB7.mov"
//        let videoURL = DatabaseService.instance.storageRef.child(videoName)
//        videoURL.downloadURL(completion: { (url, error) in
//
//            if error != nil {
//                 print(error?.localizedDescription)
//                 print("returning")
//                 return
//            }
//            print(videoURL)
//            // self.playVideo()
//            // Otherwise, you can start downloading the file you want
//            Storage.storage().reference(forURL: String(describing: videoURL)).getMetadata { (metadata, error) in
//                if error != nil {
//                    print("error getting metadata")
//                } else {
//                    videoURL.downloadURL { (url, error) in
//                        guard let downloadUrl = url else {
//                            print("trouble getting the download url")
//                            return
//                        }
//                        print(downloadUrl)
//                        if downloadUrl != nil {
//                            print("download url had been obtained and set")
//                            self.playVideo(url: downloadUrl as NSURL)
//                        }
//                    }
//            }
//
//        }
//    })
//}
    
    
}
