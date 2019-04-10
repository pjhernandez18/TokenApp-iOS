//
//  AppDelegate.swift
//  TokenApp
//
//  Created by P. J. Hernandez on 4/8/19.
//  Copyright © 2019 P. J. Hernandez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
	
//	var ref: DatabaseReference!
	
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		
		FirebaseApp.configure()
		
		let db = Firestore.firestore()
		
		db.collection("collaborations").getDocuments { (snapshot, error) in
			if let err = error {
				print("Error getting documents: \(err)")
			} else {
				for document in snapshot!.documents {
					let documentData = document.data()
					print(document.documentID, "=>", documentData)
					if let userRef = documentData["user"] as? DocumentReference, let tripRef = documentData["trip"] as? DocumentReference {
						print("u", userRef)
						print("t", tripRef)
						userRef.getDocument(completion: { (userSnapshot, error) in
							if let userDocument = userSnapshot?.data() {
								print("user", userDocument)
							}
						})
						tripRef.getDocument(completion: { (tripSnapshot, error) in
							if let tripDocument = tripSnapshot?.data() {
								print("trip", tripDocument)
							}
						})
					}
				}
			}
		}
		
		
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
