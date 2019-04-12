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
        
        // let db = Firestore.firestore()
    }
}

