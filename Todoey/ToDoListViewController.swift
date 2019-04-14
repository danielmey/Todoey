//
//  ViewController.swift
//  Todoey
//
//  Created by Daniel Meyering on 12.04.19.
//  Copyright © 2019 Daniel Meyering. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var toDoArray = [String]()
    var defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "toDoListArray") as? [String] {
            toDoArray = items
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        let addNewItem = UIAlertController(title: "Add a new item", message: "Enter text below", preferredStyle: .alert)
        var newItemTextField = UITextField()
        
        addNewItem.addTextField { (textField) in
            textField.placeholder = "New Item"
            newItemTextField = textField
        }
        addNewItem.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.toDoArray.append(newItemTextField.text!)
            self.defaults.set(self.toDoArray, forKey: "toDoListArray")
            self.tableView.reloadData()
        }))
        
        present(addNewItem, animated: true, completion: nil)
        
    }
    
    
}

