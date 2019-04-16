//
//  User.swift
//  Token
//
//  Created by P. J. Hernandez on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct User {
    
    private var _firstName: String
  //  private var _lastName: String
    private var _uid: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
//    var lastName: String {
//        return _lastName
//    }
    
    init(uid: String, firstName: String) { //lastName: String){
        _uid = uid
        _firstName = firstName
       // _lastName = lastName
    }
}

