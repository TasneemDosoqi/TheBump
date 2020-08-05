//
//  ViewController.swift
//  The Bump App
//
//  Created by Fay Alabdulhadi on 18/03/2020.
//  Copyright © 2020 Fay Alabdulhadi. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var monthNumber: UIImageView!
    
    @IBOutlet weak var monthImage: UIImageView!
    
    @IBOutlet weak var monthDesc: UILabel!
    
    @IBOutlet weak var monthSize: UIImageView!
    
    @IBOutlet weak var monthNewDesc: UILabel!
    
    @IBOutlet weak var Home: UIButton!
    
    @IBOutlet weak var community: UIButton!
    
    @IBOutlet weak var appointment: UIButton!
    
    @IBOutlet weak var account: UIButton!
    
    var userDate = ""
    
    var month1Desc = "By the end of this month, the baby is the size of a grain of rice!"
    
    var month2Desc = "By the end of this month, the baby is the size of a cherry!"
    
    var month3Desc = "By the end of this month, the baby is the size of a lemon!"
    
    var month4Desc = "By the end of this month, the baby is the size of a pear!"
    
    var month5Desc = "By the end of this month, the baby is the size of a grapefruit!"
    
    var month6Desc = "By the end of this month, the baby is the size of an eggplant!"
    
    var month7Desc = "By the end of this month, the baby is the size of a pineapple!"
    
    var month8Desc = "By the end of this month, the baby is the size of a papaya!"
    
    var month9Desc = "By the end of this month, the baby is the size of a watermelon!"
    
    var m1NewDesc = "Your baby is only .1 to .2 millimeters and at this stage is called a blastocyst. At three weeks pregnant, your child has already developed all his genetic material – and the sex is already decided."
    
    var m2NewDesc = "Your baby is now a little under an inch long but has developed into a tiny human being. The heart is beating, the brain is developing and she has developed all her limbs as well as hands and feet."
    
    var m3NewDesc = "Your baby is now officially a fetus and is between two and four inches long. By the end of the first trimester, all organs are present, and even fingernails are developing. Your baby is also moving her arms and legs."
    
    var m4NewDesc = "Your baby is five to six inches long and weighs up to four ounces. Baby’s face and heart are fully formed at this point, though the lungs are still developing. Baby’s eyes will open during this month."
    
    var m5NewDesc = "Your baby is now about 10 ounces and six to nine inches long. Baby is covered with a fine protective hair. This month he or she will develop fingerprints and permanent teeth buds behind fully formed baby teeth. Sex can be determined."
    
    var m6NewDesc = "Your baby is about 10 inches long and weighs over a pound. You’ll be aware of baby’s movements as he or she stretches and hiccups. Baby’s eyes now open and close, vocal cords are functioning."
    
    var m7NewDesc = "Your baby is starting to develop fat under his or her skin. Baby’s now almost 12 inches long and weighs between two and four pounds. Your child can now see, hear and taste, and the brain and nervous system are growing rapidly."
    
    var m8NewDesc = "Your baby’s brainwaves resemble those of a newborn by this time. He may be a foot or longer and weigh about five pounds.  The lungs and brain are continuing to develop and other body systems are refining to be ready for living outside."
    
    var m9NewDesc = "Baby’s lungs are maturing, and he/she is shedding the layer of hair that protected him/her in the uterus. Your baby’s brain is growing tremendously this last month. Baby measures about 18 to 21 inches long and weighs about 6 to 8 pounds."
    
    func setUpElements(){
        
        Utilities.styleNavigButton(Home)
        Utilities.styleNavigButton(community)
        Utilities.styleNavigButton(appointment)
        Utilities.styleNavigButton(account)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         setUpElements()
        
        let db = Firestore.firestore()

        let user = Auth.auth().currentUser

        if let user = user {

            let uid = user.uid

            let docRef = db.collection("users").document("ugPSaXUFOfbm2kk9IzYc")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")

                let data = document.data()

                self.userDate = data?["Date"] as! String

                print(self.userDate)

//
//                let start = self.userDate.index(self.userDate.startIndex, offsetBy: 5)
//                let end = self.userDate.index(self.userDate.endIndex, offsetBy: -3)
//                let range = start..<end
//
//                var monthInt = Calendar.current.dateComponents([.month], from: Date()).month
//
//                var cutMonth = ""
//
//                cutMonth = String(self.userDate[range])
//
//                var cutMonthInt = Int(cutMonth)

                
           
                var currentMonth = Int(self.userDate)
                print(currentMonth)
                
//                self.monthNumber.image = UIImage(named: "month\(currentMonth)")
//                self.monthImage.image = UIImage(named: "m\(currentMonth)")
                
                if currentMonth == 1 {
                   
                    self.monthDesc.text =  self.month1Desc
                    self.monthSize.image = UIImage(named: "wheat")
                    self.monthNewDesc.text =  self.m1NewDesc
                    self.monthImage.image = UIImage(named: "m1")
                    self.monthNumber.image = UIImage(named: "month1")
                  
                   
                   }
                   
                   else if currentMonth == 2 {
                   
                    self.monthDesc.text =  self.month2Desc
                    self.monthSize.image = UIImage(named: "cherry")
                    self.monthNewDesc.text =  self.m2NewDesc
                    self.monthImage.image = UIImage(named: "m2")
                    self.monthNumber.image = UIImage(named: "month2")
                   
                   }
                   
                   else if currentMonth == 3 {
                   
                    self.monthDesc.text =  self.month3Desc
                    self.monthSize.image = UIImage(named: "lemon")
                    self.monthNewDesc.text =  self.m3NewDesc
                    self.monthImage.image = UIImage(named: "m3")
                    self.monthNumber.image = UIImage(named: "month3")
                   
                   }
                   
                   else if currentMonth == 4 {
                   
                    self.monthDesc.text =  self.month4Desc
                    self.monthSize.image = UIImage(named: "pear")
                    self.monthNewDesc.text =  self.m4NewDesc
                    self.monthImage.image = UIImage(named: "m4")
                    self.monthNumber.image = UIImage(named: "month4")
                   
                   }
                   
                   else if currentMonth == 5 {
                   
                    self.monthDesc.text =  self.month5Desc
                    self.monthSize.image = UIImage(named: "grapefruit")
                    self.monthNewDesc.text =  self.m5NewDesc
                    self.monthImage.image = UIImage(named: "m5")
                    self.monthNumber.image = UIImage(named: "month5")
                   
                   }
                   
                   else if currentMonth == 6 {
                   
                    self.monthDesc.text =  self.month6Desc
                    self.monthSize.image = UIImage(named: "eggplant")
                    self.monthNewDesc.text =  self.m6NewDesc
                    self.monthImage.image = UIImage(named: "m6")
                    self.monthNumber.image = UIImage(named: "month6")
                   
                   }
                   
                   else if currentMonth == 7 {
                   
                    self.monthDesc.text =  self.month7Desc
                    self.monthSize.image = UIImage(named: "pineapple")
                    self.monthNewDesc.text =  self.m7NewDesc
                    self.monthImage.image = UIImage(named: "m7")
                    self.monthNumber.image = UIImage(named: "month7")
                   
                   }
                   
                   else if currentMonth == 8 {
                   
                    self.monthDesc.text =  self.month8Desc
                    self.monthSize.image = UIImage(named: "papaya")
                    self.monthNewDesc.text =  self.m8NewDesc
                    self.monthImage.image = UIImage(named: "m8")
                    self.monthNumber.image = UIImage(named: "month8")
                   
                   }
                   
                   else if currentMonth == 9 {
                   
                    self.monthDesc.text =  self.month9Desc
                    self.monthSize.image = UIImage(named: "watermelon")
                    self.monthNewDesc.text =  self.m9NewDesc
                    self.monthImage.image = UIImage(named: "m9")
                    self.monthNumber.image = UIImage(named: "month9")
                   
                   }
                
                

            } else {
                print("Document does not exist")
            }
        }

   
    
}


}

 }
