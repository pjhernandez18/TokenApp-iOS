//
//  LoginViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomizedTextField!
    @IBOutlet weak var passwordTextField: CustomizedTextField!
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("login button pressed")
        if let email = emailTextField.text, let password = passwordTextField.text, (email.characters.count > 0 && password.characters.count > 0) {
            
            AuthenticationService.instance.loginToApp(email: email, password: password, onCompletion: { (errorMessage, data) in
                guard errorMessage == nil else{
                    // Handle errors for authentication
                    let alert = UIAlertController(title: "Error Authentication", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    return
                }
                //otherwise successful login - dismiss window
                self.dismiss(animated: true, completion: nil)
            })
        } else{
            // throw alert if login input invalid
            let alert = UIAlertController(title: "Username and Password required", message: "Please enter both an email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

}
