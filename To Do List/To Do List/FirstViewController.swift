//
//  FirstViewController.swift
//  To Do List
//
//  Created by Ishaan Sathaye on 6/27/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

var toDoList = [String]() //global variable array

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var toDoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "toDoList") != nil { //checks if the list is not empty
            
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String] //then retrieves the data
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count //how many cells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row] //changes the cell to have the name at that row
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete { //deletes it with a swipe to the left
            
            toDoList.remove(at: indexPath.row) //removes from array
            
            UserDefaults.standard.setValue(toDoList, forKey: "toDoList") //removes from permanent storage
            
            toDoListTable.reloadData() //updates the table view
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        toDoListTable.reloadData() //udpate data when adding a new item
    }

}

