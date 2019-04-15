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
    
    var ref: DatabaseReference {
        return Database.database().reference()
    }
    // add another reference for users
    var usersRef: DatabaseReference{
        return ref.child("users")
    }
    
    var storageRef: StorageReference{
        
        //copy the URL from Firebase Storage section. Yours is unique
        return Storage.storage().reference(forURL:"gs://token-7acc3.appspot.com/")
    }
    
    var videoStorageRef: StorageReference{
        
        return storageRef.child("videos")
    }
    
    func saveUser(uid: String){
        // create profile object
        let profile: Dictionary<String, AnyObject> = ["firstName": "Jerry" as AnyObject, "lastName": "Zhao" as AnyObject]
        ref.child("users").child(uid).child("profile").setValue(profile)
    }
    
    func sendRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL: URL, text: String? = nil){
        
        var uids = [String]()
        
        for uid in sendingTo.keys{
            uids.append(uid)
            let request: Dictionary<String, AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject, "userID":senderUID as AnyObject, "openCount":0 as AnyObject, "userReceieved":uids as AnyObject]
            ref.child("requests").childByAutoId().setValue(request)
        }
    }
    
}
  
