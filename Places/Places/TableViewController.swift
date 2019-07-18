//
//  TableViewController.swift
//  Places
//
//  Created by Ishaan Sathaye on 7/15/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()] // dictionary to store locations

var activePlace = -1

var didLoad = false

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "places") != nil { //checks if the list is not empty
            
            places = UserDefaults.standard.object(forKey: "places") as! [Dictionary<String, String>] // permanent storage
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) { // when the app appears
        
        if places.count == 1 && didLoad == false {
            
            didLoad = true
            
            places.remove(at: 0)
            
            places.append(["name":"Ex. Eiffel Tower", "lat": "48.858324", "lon": "2.294764"]) // add this location as an exampled

        }
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newPlace" {
            
            activePlace = -1
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { // able to delete locations
        
        if editingStyle == .delete {
            
            places.remove(at: indexPath.row) // update the dictionary
            
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            UserDefaults.standard.setValue(places, forKey: "places")
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        activePlace = indexPath.row
        
        return indexPath
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count // amount of rows
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // create each cell with the information in the dictionary at each row in the table
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }

}
