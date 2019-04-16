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
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        
//        let layout = UICollectionViewFlowLayout()
//        window?.rootViewController = UINavigationController(rootViewController: FeedViewController(collectionViewLayout: layout))
       
        // let db = Firestore.firestore()
    }
}

