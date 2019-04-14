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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
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
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
