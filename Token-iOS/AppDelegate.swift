/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Implements the application delegate.
*/

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        FirebaseApp.configure()
        print("app started")
        // ignore the storyboard
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = UINavigationController(rootViewController: FeedViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let feed = FeedViewController()
		let camera = TokenCameraViewController()
		let profile = ProfileViewController()
		camera.profileViewController = profile
        window?.rootViewController = PageViewController(pages: [feed, camera, UINavigationController(rootViewController: feed)], transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        //let layout = UICollectionViewFlowLayout()
        //window?.rootViewController = UINavigationController(rootViewController: Feed2ViewController (collectionViewLayout: layout))
        
        // Authenticate test user so that Firebase stuff works
        AuthenticationService.instance.loginToApp(email: "test@usc.edu", password: "test123", onCompletion: { (errorMessage, data) in
            guard errorMessage == nil else{
                let alert = UIAlertController(title: "Error Authentication", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
               // self.present(alert, animated: true, completion: nil)
                return
            }
            print("test user authenticated")
        })
    }
}

