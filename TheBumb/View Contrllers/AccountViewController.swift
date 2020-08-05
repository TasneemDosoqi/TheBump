//
//  HomeViewController.swift
//  TheBumbFin
//
//  Created by Muneera Alshaalan on 26/07/1441 AH.
//  Copyright © 1441 Muneera Alshaalan. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

struct Users {
    var Date : String
    // var UserName : String
    var Name : String
    var Pass : String
}

class AccountViewController: UIViewController {

    
    @IBOutlet weak var UserName: UITextView!
    
    @IBOutlet weak var UserType: UITextView!
    
    @IBOutlet weak var UserPassword: UITextView!
    
    @IBOutlet weak var UserDueDate: UITextView!
    
    var name = ""
    var password = ""
    var due = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewprofile()
    }
    
    
    
    func viewprofile() {
        
        let db = Firestore.firestore()
            
            let user = Auth.auth().currentUser
            
            if let user = user {
        
                let uid = user.uid

                let docRef = db.collection("users").document("ugPSaXUFOfbm2kk9IzYc")
                
                
                docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    
                    print("Cached document data: \(dataDescription)")
                        
                    let data = document.data()
                    
                    
                    self.name = data?["Name"] as! String
                        //let type = data["Name"] as! String
                    self.password = data?["Pass"] as! String
                    self.due = data?["Date"] as! String
                    self.UserName.text = self.name
                    self.UserType.text = "Mom"
                    self.UserPassword.text = self.password
                    self.UserDueDate.text = self.due
                    } else {
                        print("Document does not exist")
                    }
                
                
        }
        
        }
    
    }
    
    
    func transitionToEditeUserProfile() {
        let userediteprofileViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.userediteprofileViewController) as? EditUserProfileViewController
        view.window?.rootViewController = userediteprofileViewController
        view.window?.makeKeyAndVisible()
    }

}
