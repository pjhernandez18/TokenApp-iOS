//
//  AuthenticationService.swift
//  Token
//
//  Created by P. J. Hernandez on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import FirebaseAuth
typealias Completion = (_ errorMessage: String?, _ data: AnyObject?) -> Void

class AuthenticationService {
    private static let _instance = AuthenticationService()

    static var instance: AuthenticationService {
        return _instance
        
    }
    func loginToApp(email: String, password: String, onCompletion: Completion?){
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            //guard let strongSelf = self else { return }
             // we'll either get a user error or an error, so we need to handle what happens in each state
            //handle errors here
          //  let user = Auth.auth().currentUser
            if error != nil {
                if let error = AuthErrorCode(rawValue: error!._code){

                    if error == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //handle errors here
                                self.handleFBErrors(error: error! as NSError, onComplete: onCompletion)
                            }else {
                                if user != nil {
                                    print("Here")
                                    DatabaseService.instance.saveUser(uid: "12345") 
                                    //Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFBErrors(error: error! as NSError, onComplete: onCompletion)
                                        } else{
                                            //login was successful -> Let VC know this
                                            onCompletion?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else{
                    //handle error
                    self.handleFBErrors(error: error! as NSError, onComplete: onCompletion)
                }
            } else {
                // successful login
                onCompletion?(nil, user)
            }
        })
    }
    
    func handleFBErrors(error: NSError, onComplete: Completion?){
        
        print(error.debugDescription)
        
        if let error = AuthErrorCode(rawValue: error._code){
            switch error {
            case .invalidEmail:
                onComplete?("Invalid Email Address", nil)
                break
            case .wrongPassword:
                onComplete?("Invalid Email Address", nil)
                break
            case .emailAlreadyInUse:
                onComplete?("Email Address Already in Use", nil)
                break
            case .networkError:
                onComplete?("Network Error Please Try Again", nil)
                break
            default:
                onComplete?("Unknown Error Please Try Again", nil)
                break
            }
        }
    }
}
