//
//  CustomizedTextField.swift
//  Token
//
//  Created by P. J. Hernandez on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
// messing around with customized text fields

@IBDesignable
class CustomizedTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var bgColor: UIColor? {
        
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let string = NSAttributedString(string: rawString, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor!])
            attributedPlaceholder = string
        }
    }
    
}
