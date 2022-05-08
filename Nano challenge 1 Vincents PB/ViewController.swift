//
//  ViewController.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 27/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var foodTable: UITableView!
    
    
    var foodList = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            foodTable.dataSource = self
            foodTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Food")
          
          do {
            foodList = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "foodNameID", for: indexPath) as! NoteCell
        
        
        noteCell.foodNameLabel.text = foodList[indexPath.row].value(forKey: "foodName") as? String
        noteCell.notesLabel.text =  foodList[indexPath.row].value(forKey: "notes") as? String
        noteCell.lifeSpanLabel.text = (foodList[indexPath.row].value(forKey: "lifeSpan") as? Date)?.formatToString()
        return noteCell
    }

//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        // Create Swipe Actio
//        let action = UIContextualAction (style: .destructive, title: "Delete"){(action, view, completionHandler) in
//
//        // ToDo: Which Foodlist to remove
//        let foodListToRemove = self.foodList[indexPath.row]
//
//        // ToDo: Remove the FoodList
//        self.foodTable.delete(foodListToRemove)
//
//        // Todo: Save the Data
//            do {
//                try self.foodTable.save()
//            }
//            catch {
//            }
//
//        // TodDo: Re-Fetch the data
//            self.foodTable
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            foodList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewFood{
            vc.updateData = { [weak self] in
                guard let appDelegate =
                    UIApplication.shared.delegate as? AppDelegate else {
                      return
                  }
                  
                  let managedContext =
                    appDelegate.persistentContainer.viewContext
                  
                  let fetchRequest =
                    NSFetchRequest<NSManagedObject>(entityName: "Food")
                  
                  do {
                      self?.foodList = try managedContext.fetch(fetchRequest)
                  } catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
                  }
                self?.foodTable.reloadData()
            }
        }
    }
}

