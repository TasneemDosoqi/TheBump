//
//  AppointmentsViewController.swift
//  TheBumb
//
//  Created by Khawlah on 01/08/1441 AH.
//  Copyright © 1441 Tasneem Dosoqi. All rights reserved.
//

import UIKit
import CoreData






class AppointmentsViewController: UITableViewController {
    
    
//    @IBOutlet weak var Home: UIButton!
//
//    @IBOutlet weak var community: UIButton!
//
//    @IBOutlet weak var appointment: UIButton!
//
//    @IBOutlet weak var account: UIButton!
    
    
    
//    func setUpElements(){
//
//        Utilities.styleNavigButton(Home)
//        Utilities.styleNavigButton(community)
//        Utilities.styleNavigButton(appointment)
//        Utilities.styleNavigButton(account)
//
//    }
    
     var listItems = [NSManagedObject]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
//            setUpElements()
       }
       
    
    
    
    
    @IBAction func AddButtonPressed(_ sender: UIButton) {
        
        var textField = UITextField()
                    let alertController = UIAlertController(title: "Add new appointment", message: "", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "Add", style: .default, handler: ({
                        (_) in
                        if let field = alertController.textFields![0] as? UITextField  {
                            self.saveItem(itemToSave: field.text!)
                            self.tableView.reloadData()
                        }
                        }
                    ))
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addTextField{ (field) in
                        textField = field
                        textField.placeholder = " add new appointments"
                    }
                    alertController.addAction(confirmAction)
                    alertController.addAction(cancelAction)
                    
                    self.present(alertController, animated: true, completion: nil)
    }
    
       
       
       
       override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       
       
    /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle==UITableViewCell.EditingStyle.delete{
               context.delete(self.listItems[indexPath.row])
               do{
                  try context.save()
                   self.listItems.remove(at: indexPath.row)
                   self.tableView.reloadData()
               }catch{
                   print("Error")
                   
               }
               
           }
       }*/
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle==UITableViewCell.EditingStyle.delete{
               context.delete(self.listItems[indexPath.row])
               do{
                   try context.save()
                   self.listItems.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                    self.tableView.reloadData()
               }catch{
                   print("Error")
               }
               
           }
       }
     

       
       func saveItem(itemToSave : String){
           _ = UIApplication.shared.delegate as! AppDelegate
           let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContext)
           let item = NSManagedObject(entity: entity! , insertInto: managedContext)
           item.setValue(itemToSave, forKey: "item")
         
           
           do{
               try managedContext.save()
               listItems.append(item)
           }catch{
               print("Erorr")
           }
       }
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if tableView.cellForRow(at: indexPath)?.accessoryType==UITableViewCell.AccessoryType.checkmark
           {
               tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
           }
           else{
               tableView.cellForRow(at: indexPath)?.accessoryType=UITableViewCell.AccessoryType.checkmark
           }
       
       
     
           }
    
       
       override func viewWillAppear(_ animated: Bool) {
           
           _ = UIApplication.shared.delegate as! AppDelegate
           let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
          // let request = NSFetchRequest<NSManagedObject>  (entityName: "ListEntity")
           let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ListEntity")
           
           do{
               let result = try managedContext.fetch(fetchRequest)
              
               listItems = result  as! [NSManagedObject]
               
           }catch{
               print("Error")
           }
       }
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return listItems.count
       }
       
       // if there an error check this
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
           let  item = listItems[indexPath.row]
           cell.textLabel?.text = item.value(forKey: "item") as! String
           return cell
       }


}
