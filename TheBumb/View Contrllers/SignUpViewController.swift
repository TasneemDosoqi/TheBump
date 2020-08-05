//
//  SignUpViewController.swift
//  TheBumb
//
//  Created by Tasneem Dosoqi on 15/03/2020.
//  Copyright © 2020 Tasneem Dosoqi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    @IBOutlet weak var DueDateTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var upper: UIImageView!
    
    @IBOutlet weak var fotter: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        setUpElements()
        
        
    }
    func setUpElements (){
        ErrorLabel.alpha = 0
        // Style the elements
        Utilities.styleTextField(NameTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(UserNameTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleTextField(DueDateTextField)
        Utilities.styleFilledButton(SignUpButton)
        
    }
    
    
    func validateFields() -> String? {
    
    if NameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        UserNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        DueDateTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        
        return "Please fill in all fields."
    }
    let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if Utilities.isPasswordValid(cleanedPassword) == false {
        return "Please make sure your password is at least 8 characters, contains a special character and a number."
    }
    
        return nil
        
    }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
        }
        else {
            
            let Name = NameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let userName = UserNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let date = DueDateTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    self.transitionToHome()
                }
                else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["UserName":userName, "Email":email, "Pass":password, "Name":Name, "Date":date ]) { (error) in
                        
                        if error != nil {
                            self.transitionToHome()
                        }
                    }
                    
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let accountViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.accountViewController) as? AccountViewController
        view.window?.rootViewController = accountViewController
        view.window?.makeKeyAndVisible()
        
    }
}
