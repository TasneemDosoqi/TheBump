//
//  EditAdminProfileViewController.swift
//  TheBumbFin
//
//  Created by Muneera Alshaalan on 26/07/1441 AH.
//  Copyright © 1441 Muneera Alshaalan. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class EditAdminProfileViewController: UIViewController {
    
    @IBOutlet weak var EditAdminError: UILabel!
    
    @IBOutlet weak var AdminEditedName: UITextField!
    
    @IBOutlet weak var AdminEditedPassword: UITextField!
    
    @IBOutlet weak var UpdateAdminInfo: UIButton!
    
    
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements (){
        EditAdminError.alpha = 0
    }
    
    func validateFields() -> String? {
        if AdminEditedName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" &&
            AdminEditedPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "You must to edit one field atleast."
        }
        let newName = AdminEditedName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if newName.count > 0{
        if Utilities.isName(newName) == false {
            return "Please make sure you enter a valid name."
            }
        }
         let newPassword = AdminEditedPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if newPassword.count > 0{
        if Utilities.isPasswordValid(newPassword) == false {
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        }
        return nil
    }
    
    @IBAction func EditAdminInfo(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let id = "Ae4bWicbK3bXclSecqayu7JtZU82"
            let name = AdminEditedName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = AdminEditedPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let database = Firestore.firestore()
            if AdminEditedName.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
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
            if AdminEditedPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
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
            self.transitionToViewAdimnProfile()
        }
    }
    
    func transitionToViewAdimnProfile() {
        let adminHomeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.adminHomeViewController) as? AdminHomeViewController
        view.window?.rootViewController = adminHomeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message:String) {
        EditAdminError.text = message
        EditAdminError.alpha = 1
    }
    
}
