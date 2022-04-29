//
//  ViewController.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 27/04/22.
//

import UIKit

import CoreData



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var foodList = [NSManagedObject]()

    @IBOutlet weak var foodTable: UITableView!
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
          
          //2
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Food")
          
          //3
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

}

