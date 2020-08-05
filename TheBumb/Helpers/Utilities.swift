//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor(red:0.91, green:0.52, blue:0.53, alpha:1.0).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor(red:0.91, green:0.52, blue:0.53, alpha:1.0)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func isName(_ name : String) -> Bool {
          let nameTest = NSPredicate(format: "SELF MATCHES %@", "^(?![ .]+$)[a-zA-Z .]*$")
          return nameTest.evaluate(with: name)
      }
      
      static func isNumber(_ date : String) -> Bool {
          let dateTest = NSPredicate(format: "SELF MATCHES %@", "^[0-9]*$")
          return dateTest.evaluate(with: date)
      }
    
    static func styleQuestionTextField(_ textfield:UITextField) {
        
        textfield.layer.borderColor = UIColor(red:0.91, green:0.52, blue:0.53, alpha:1.0).cgColor
        textfield.layer.borderWidth = 1.0
        textfield.layer.cornerRadius = 8
        
    }
    
    
    static func styleNavigButton(_ button:UIButton) {
        
        // Filled style
        button.backgroundColor = UIColor(red:0.91, green:0.52, blue:0.53, alpha:1.0)
        button.tintColor = UIColor.white
    }

    static func styleTableView(_ table:UITableView) {
        
        // Filled rounded corner style
        table.layer.borderColor = UIColor(red:0.91, green:0.52, blue:0.53, alpha:1.0).cgColor
        table.layer.borderWidth = 1.0
        table.layer.cornerRadius = 4

    }
    
    
    
}
