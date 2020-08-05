//
//  EditUserProfileViewController.swift
//  TheBumbFin
//
//  Created by Muneera Alshaalan on 26/07/1441 AH.
//  Copyright © 1441 Muneera Alshaalan. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class EditUserProfileViewController: UIViewController {
    
    @IBOutlet weak var EditUserError: UILabel!
    
    @IBOutlet weak var UserEditedName: UITextField!
    
    @IBOutlet weak var UserEditedPassword: UITextField!
    
    @IBOutlet weak var UserEditedDueDate: UITextField!
    
    @IBOutlet weak var UpdateUserInfo: UIButton!
    
    
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements (){
        EditUserError.alpha = 0
    }
    
    func validateFields() -> String? {
        if UserEditedName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" &&
            UserEditedPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" &&
            UserEditedDueDate.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            return "You must to edit one field atleast."
        }
        let newName = UserEditedName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if newName.count > 0 {
        if Utilities.isName(newName) == false {
            return "Please make sure you enter a valid name."
        }
        }
        let newDuedate = UserEditedDueDate.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if newDuedate.count > 0 {
        if Utilities.isNumber(newDuedate) == false {
            return "Please make sure you enter a number."
        }
        }
        let newPassword = UserEditedPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if newPassword.count > 0 {
        if Utilities.isPasswordValid(newPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        }
        return nil
    }
    
    @IBAction func EditUserInfo(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let id = "ugPSaXUFOfbm2kk9IzYc"
            let name = UserEditedName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = UserEditedPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let duedate = UserEditedDueDate.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let database = Firestore.firestore()
            if UserEditedName.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                database.collection("users").document(id).updateData([
                    "Name": name,
                    ])
                { err in
                    if let err = err {
                        print("Error")
                        return
                    } else {
                        print("The name updated successfully")
                    }
                }
                
            }
            if UserEditedPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                database.collection("users").document(id).updateData([
                    "Pass": password,
                    ])
                { err in
                    if let err = err {
                        print("Error")
                        return
                    } else {
                        print("The password updated successfully")
                    }
                }
            }
            if UserEditedDueDate.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                database.collection("users").document(id).updateData([
                    "Date": duedate,
                    ])
                { err in
                    if let err = err {
                        print("Error")
                        return
                    } else {
                        print("The date updated successfully")
                    }
                }
                
            }
            self.transitionToViewUserProfile()
        }
    }
    
    func transitionToViewUserProfile() {
        let accountViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.accountViewController) as? AccountViewController
        view.window?.rootViewController = accountViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message:String) {
        EditUserError.text = message
        EditUserError.alpha = 1
    }
    
}
