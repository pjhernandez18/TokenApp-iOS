//
//  UsersViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [User]()
    private var selectedUsers = Dictionary<String, User>()
    private var _videoURL: URL?
    
    var videoURL: URL? {
        set {
            _videoURL = newValue
        } get {
            return _videoURL 
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        //send snap button should only appear once users have been checked
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        DatabaseService.instance.usersRef.observeSingleEvent(of: .value){(snapshot: DataSnapshot) in
            
            print(snapshot.debugDescription)
            if let users = snapshot.value as? Dictionary<String, AnyObject> {
                for (key, value) in users {
                    if let dict = value as? Dictionary<String, AnyObject> {
 
                        if let profile = dict["profile"] as? Dictionary<String, AnyObject> {
                            if let firstName = profile["firstName"] as? String {
                                let uid = key
                                let user = User(uid: uid, firstName: firstName)
                                self.users.append(user)
                            }
                        }
                    }
                }
                self.tableView.reloadData()
                print(self.users)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomizedUserCell") as! CustomizedUserCell
        let user = users[indexPath.row]
        cell.updateUI(user: user)
        return cell
    
        // return UITableViewCell()
    }
    // if row is selected, we want to show a check mark
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationItem.rightBarButtonItem?.isEnabled = true
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomizedUserCell
        cell.toggleCheckmark(selected: true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomizedUserCell
        cell.toggleCheckmark(selected: false)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = nil
        
        if selectedUsers.count == 0 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func sendSnapButtonPressed(_ sender: Any) {
        
        //code uploads the video to firebase
        
        if let url = _videoURL {
            
            //creates a unique name for the video and avoids possible duplication problems.
            let videoName = "\(NSUUID().uuidString)\(url)"
            let ref = DatabaseService.instance.videoStorageRef.child(videoName)
            let _ = ref.putFile(from: url as URL, metadata: nil) { (metadata, error) in
                if error == nil {
                    print("successful video upload")
                } else{
                    print(error?.localizedDescription)
                }
//                guard let metadata = metadata else {
//                    // Uh-oh, an error occurred!
//                    print("error 1 occured")
//                    return
//                }
                // You can also access to download URL after upload.
                DatabaseService.instance.videoStorageRef.downloadURL { (url, error) in
                    guard url != nil else {
                        // Uh-oh, an error occurred!
                        print("error 2 occured")
                        return
                    }
                }
            }
//            let _ = ref.putFile(from: url, metadata: nil, completion: {(meta: StorageMetadata?, err: Error?) in
//                if err != nil {
//                    print("error uploading video")
//                } else {
//                    let downloadURL = ref.downloadURL{ url, error in
//                        if let error = error {
//                            print(error)
//                        }else {
//
//                        }
//                    }
//                    print(downloadURL)
//                    self.dismiss(animated: true, completion: nil)
//                }
//            })

        }
    }
    
    
    
}
