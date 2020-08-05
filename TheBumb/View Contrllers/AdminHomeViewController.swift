//
//  AdminHomeViewController.swift
//  TheBumbFin
//
//  Created by Muneera Alshaalan on 26/07/1441 AH.
//  Copyright © 1441 Muneera Alshaalan. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

struct Admins {
    var Name : String
    //var UserName : String
    var Pass : String
}

class AdminHomeViewController: UIViewController {
    
    @IBOutlet weak var AdminName: UITextView!
    
    @IBOutlet weak var AdminType: UITextView!
    
    @IBOutlet weak var AdminPassword: UITextView!
    

    @IBOutlet weak var UpdateViewButton: UIButton!
    

    @IBOutlet weak var FAQButton: UIButton!
    
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

                  let docRef = db.collection("users").document("Ae4bWicbK3bXclSecqayu7JtZU82")
                  
                  
                  docRef.getDocument { (document, error) in
                  if let document = document, document.exists {
                      let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                      
                      print("Cached document data: \(dataDescription)")
                          
                      let data = document.data()
                      
                      
                      self.name = data?["Name"] as! String
                          //let type = data["Name"] as! String
                      self.password = data?["Pass"] as! String
                      self.AdminName.text = self.name
                      self.AdminType.text = "Admin"
                      self.AdminPassword.text = self.password
                      
                      } else {
                          print("Document does not exist")
                      }
                  
                  
          }
          
          }
    

    }
    
    
    func transitionToEditeAdimnProfile() {
        let adminEditeProfileViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.adminEditeProfileViewController) as? EditAdminProfileViewController
        view.window?.rootViewController = adminEditeProfileViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
