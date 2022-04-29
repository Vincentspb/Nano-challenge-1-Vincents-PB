//
//  NewFood.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 28/04/22.
//

import UIKit

class NewFood: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var notesField: UITextField!
    
    @IBOutlet weak var foodNameField: UITextField!
    
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
    
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {
        //when date picker is changed, this function will be run
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    
    
}
