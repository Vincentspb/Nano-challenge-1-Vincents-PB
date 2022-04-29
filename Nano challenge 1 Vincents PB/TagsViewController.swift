//
//  TagsViewController.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 28/04/22.
//

import UIKit

class TagsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tagsTableView: UITableView!
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    let names = [
        "Meat",
        "Vegetable",
        "Fruit",
        "Cooked Food",
        "Beverage",
        "Other"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTags")
        tagsTableView.delegate = self
        tagsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        print("you tapped me! \(names[indexPath.row])")
        
        var selectedLabel = names[indexPath.row]
        print(selectedLabel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTags", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        print("you have detappedme! \(names[indexPath.row])")
    }
}
    


