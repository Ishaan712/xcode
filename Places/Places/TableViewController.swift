//
//  TableViewController.swift
//  Places
//
//  Created by Ishaan Sathaye on 7/15/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()]

var activePlace = -1

var didLoad = false

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(places.count)
        print(places[0])
        
        if UserDefaults.standard.object(forKey: "places") != nil { //checks if the list is not empty
            
            places = UserDefaults.standard.object(forKey: "places") as! [Dictionary<String, String>]
        }
        
    }

    // MARK: - Table view data source
    
    override func viewDidAppear(_ animated: Bool) {
        
        if places.count == 1 && didLoad == false {
            
            didLoad = true
            
            places.remove(at: 0)
            
            places.append(["name":"Ex. Eiffel Tower", "lat": "48.858324", "lon": "2.294764"])

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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            places.remove(at: indexPath.row)
            
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
        
        return places.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
