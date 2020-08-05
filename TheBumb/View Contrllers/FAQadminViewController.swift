//
//  FAQadminViewController.swift
//  TheBump-v1
//
//  Created by rahaf  on 20/03/2020.
//  Copyright © 2020 rahaf. All rights reserved.
//
import UIKit
import FirebaseFirestore
import Firebase

struct AskedQuestions {
    var Question: String
    var documentId: String
}

class FAQadminViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var faqLabel: UILabel!
    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var answerTextFeild: UITextField!
    
    //variables
    var AskedQuestionsArrey = [AskedQuestions]()
    var db:Firestore!
    var theQuestionSelectedID = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        setUpElements()
        loadData()
    }
    
    func setUpElements(){
        Utilities.styleQuestionTextField(answerTextFeild)
        Utilities.styleFilledButton(answerButton)
        Utilities.styleFilledButton(backButton)
        Utilities.styleTableView(tableview)
    }
    
    func loadData(){
        AskedQuestionsArrey.removeAll()
        db.collection("AskedQuestions").getDocuments { (querySnapshot, error) in
           if let error = error
           {
               print("Error getting documents: \(error)")
           }
           else
           {
        for document in querySnapshot!.documents {
           let data = document.data()
           let theQue = data["Question"] as! String
           let documentId = document.documentID

           let newQ = AskedQuestions(Question: theQue, documentId: documentId)
           self.AskedQuestionsArrey.append(newQ)
           
               }
               self.tableview.reloadData()
           }
       }
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
             return 1
         }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.AskedQuestionsArrey.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! TableViewCellAdmin
          cell.configureCell(faq: AskedQuestionsArrey[indexPath.row])
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let theQuestionSelected = AskedQuestionsArrey[indexPath.row].Question
          theQuestionSelectedID = AskedQuestionsArrey[indexPath.row].documentId
          self.questionTextView.text = theQuestionSelected
          
      }
    
    @IBAction func saveAnsweredQuestion(_ sender: Any) {
        
        var message = ""
               let newQues = questionTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                          if newQues == "Question"{
                              message = "Please choose a question before click the button."
               }
               else{
               if answerTextFeild.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                        message = "Please answer the question before click the button."
                           }
           
                   else{
                   let newAns = answerTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       
                   db.collection("Community").addDocument(data: ["Question" : newQues, "Answer": newAns])
                       db.collection("AskedQuestions").document(theQuestionSelectedID).delete()
                      self.questionTextView.text = "Question"
                       self.answerTextFeild.text = ""
                       loadData()
                       
                   message = "your answer will be added to the questions community, thank you."
                       
                   }
           
           }
               let alertController:UIAlertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
               let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
               alertController.addAction(alertAction)
               self.present(alertController, animated: true, completion: nil)

           }
    
    
}
 
