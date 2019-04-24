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
		
		let page = PageViewController(pages: [feed, camera, UINavigationController(rootViewController: profile)], transitionStyle: .scroll, navigationOrientation: .horizontal)
		
		feed.pageViewController = page
		camera.pageViewController = page
		profile.pageViewController = page
		
        window?.rootViewController = page
        
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

