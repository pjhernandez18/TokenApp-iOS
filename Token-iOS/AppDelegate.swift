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
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        
//        let mainVC = StartViewController()
//        window?.rootViewController = mainVC
        
        //let layout = UICollectionViewFlowLayout()
        //window?.rootViewController = UINavigationController(rootViewController: FeedViewController(collectionViewLayout: layout))

        AuthenticationService.instance.loginToApp(email: "test@usc.edu", password: "test123", onCompletion: { (errorMessage, data) in
            guard errorMessage == nil else{
                let alert = UIAlertController(title: "Error Authentication", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
               // self.present(alert, animated: true, completion: nil)
                return
            }
            print("test user authenticated")
        })
        
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        let layout = UICollectionViewFlowLayout()
//        window?.rootViewController = UINavigationController(rootViewController: FeedViewController(collectionViewLayout: layout))
//       
        // let db = Firestore.firestore()
    }
}

