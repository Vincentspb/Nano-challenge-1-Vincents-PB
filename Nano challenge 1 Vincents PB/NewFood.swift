//
//  NewFood.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 28/04/22.
//

import UIKit
import CoreData

class NewFood: UIViewController {

    var updateData: (()->())?
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var notesField: UITextField!
    @IBOutlet weak var foodNameField: UITextField!
    @IBAction func donePressed(_ sender: Any) {
        print(foodNameField.text ?? "")
        print(notesField.text ?? "")
        print (dateTextField.text ?? "")
        
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
          NSEntityDescription.entity(forEntityName: "Food",
                                     in: managedContext)!
        
        let food = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        food.setValue(foodNameField.text!, forKeyPath: "foodName")
        food.setValue(notesField.text!, forKeyPath: "notes")
        food.setValue(datePicker.date, forKeyPath: "lifeSpan")
        
        // 4
        do {
          try managedContext.save()
//            self.foodList.append(food)
            self.dismiss(animated: true)
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
            dateTextField.text = formatter.string(from: date)
            dateTextField.textColor = .blue
            datePicker.datePickerMode = .date
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        updateData?()
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {
        //when date picker is changed, this function will be run
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    
    
}
