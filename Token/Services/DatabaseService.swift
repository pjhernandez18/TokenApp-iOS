//
//  DatabaseService.swift
//  Token
//
//  Created by P. J. Hernandez on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase

class DatabaseService {
    
    // make sure there's only one instance of it in the lifetime of the app
    private static let _instance = DatabaseService()
    
    static var instance: DatabaseService {
        return _instance
    }
    
    // reference to real-time database
    var ref: DatabaseReference {
        return Database.database().reference()
    }
    
    //reference to users in real-time database
    var usersRef: DatabaseReference{
        return ref.child("users")
    }
    // provide a reference to Firebase Storage
    var storageRef: StorageReference{
        
        //copy the URL from Firebase Storage section. Yours is unique
        return Storage.storage().reference(forURL:"gs://token-7acc3.appspot.com/")
    }
    // provide a reference to Firebase storage for videos taken on the in-app camera
    var videoStorageRef: StorageReference{
        
        return storageRef.child("videos")
    }
    // save users on to the real-time database
    func saveUser(uid: String){
        // create profile object
        let profile: Dictionary<String, AnyObject> = ["firstName": "Jerry" as AnyObject, "lastName": "Zhao" as AnyObject]
        ref.child("users").child(uid).child("profile").setValue(profile)
    }
    
    // A request is a token. this function sends tokens to selected users
    func sendRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL: URL, text: String? = nil){
        
        var uids = [String]()
        
        for uid in sendingTo.keys{
            uids.append(uid)
            let request: Dictionary<String, AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject, "userID":senderUID as AnyObject, "openCount":0 as AnyObject, "userReceieved":uids as AnyObject]
            ref.child("requests").childByAutoId().setValue(request)
        }
    }
    
    // save trip details on to the real-time database
    func saveTrip(name: String, startDate: String, endDate: String){
        // need to generate a unique trip id
        let trip: Dictionary<String, AnyObject> = ["tripName": name as AnyObject, "startDate": startDate as AnyObject, "endDate": endDate as AnyObject]
        ref.child("trips").child("123").child("tripDetails").setValue(trip)
    }
    
    
    
}
  
