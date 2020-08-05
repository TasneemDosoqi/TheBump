//
//  FAQviewController.swift
//  TheBump-v1
//
//  Created by rahaf  on 17/03/2020.
//  Copyright © 2020 rahaf. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

struct Community {
    var Question: String
    var Answer: String
    var documentId: String

}

class FAQviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    //outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var getQuestion: UITextField!
    @IBOutlet weak var AskQuestion: UIButton!
    @IBOutlet weak var faqLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var Home: UIButton!
    @IBOutlet weak var community: UIButton!
    @IBOutlet weak var appointment: UIButton!
    @IBOutlet weak var account: UIButton!
    
    //variables
    var CommunityArrey = [Community]()
    var db:Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        setUpElements()
        loadData()
        
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleQuestionTextField(getQuestion)
        Utilities.styleFilledButton(AskQuestion)
        Utilities.styleTableView(tableView)
        Utilities.styleNavigButton(Home)
        Utilities.styleNavigButton(community)
        Utilities.styleNavigButton(appointment)
        Utilities.styleNavigButton(account)

    }
    
    func loadData(){
        CommunityArrey.removeAll()
     db.collection("Community").getDocuments { (querySnapshot, error) in
        if let error = error
        {
            print("Error getting documents: \(error)")
        }
        else
        {
     for document in querySnapshot!.documents {
        let data = document.data()
        let theQue = data["Question"] as! String
        let theAns = data["Answer"] as! String
        let documentId = document.documentID

        let newFAQ = Community(Question: theQue, Answer: theAns, documentId: documentId)
        self.CommunityArrey.append(newFAQ)
        
            }
            self.tableView.reloadData()
        }
    }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.CommunityArrey.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! TableViewCell
    cell.configureCell(faq: CommunityArrey[indexPath.row])
    return cell
    
    }
    
    func validateFields() -> String? {
    
    if getQuestion.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        
        return "Please ask a question before click the button."
    }
        return nil
    }
    
    @IBAction func saveQuestion(_ sender: Any) {
        
        let error = validateFields()
               
               if error != nil {
                   
                   showError(error!)
               }
               else {
                   errorLabel.alpha = 0
                   let newQues = getQuestion.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                    db.collection("AskedQuestions").addDocument(data: ["Question" : newQues])
                self.getQuestion.text = ""
                let message = "your question will be answerd within 1 day, thank you."
                let alertController:UIAlertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
                       
                       // Create a UIAlertAction object, this object will add a button at alert dialog bottom, the button text is OK, when click it just close the alert dialog.
                       let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                       
                       // Add alertAction object to alertController.
                       alertController.addAction(alertAction)
                       // Popup the alert dialog.
                self.present(alertController, animated: true, completion: nil)

                   
               }
       
    }
    
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}




