//
//  LoginViewController.swift
//  TheBumb
//
//  Created by Tasneem Dosoqi on 15/03/2020.
//  Copyright © 2020 Tasneem Dosoqi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var BackButton: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var upper: UIImageView!
    @IBOutlet weak var fotter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationController?.isNavigationBarHidden = true
     
            setUpElements()
        }
        
        func setUpElements() {
            
            ErrorLabel.alpha = 0
            
            Utilities.styleTextField(EmailTextField)
            Utilities.styleTextField(PasswordTextField)
            Utilities.styleFilledButton(SignInButton)
            
        }
    
    @IBAction func LogInTapped(_ sender: Any) {
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
               
               // Signing in the user
               Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                   
                   if error != nil {
                       // Couldn't sign in
                       self.ErrorLabel.text = error!.localizedDescription
                       self.ErrorLabel.alpha = 1
                   }
                   else {

                    if email.contains("admin@hotmail.com") {
                        let admainscreen = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.adminHomeViewController) as? AdminHomeViewController
                        
                        self.view.window?.rootViewController = admainscreen
                        self.view.window?.makeKeyAndVisible()
                        
                    }else {
                        let accViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.accountViewController) as? AccountViewController
                        
                        self.view.window?.rootViewController = accViewController
                        self.view.window?.makeKeyAndVisible()
                    }
                       
                   }
               }
    }
    
}
