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

    
    
    
}

