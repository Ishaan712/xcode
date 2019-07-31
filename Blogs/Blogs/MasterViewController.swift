//
//  MasterViewController.swift
//  Blogs
//
//  Created by Ishaan Sathaye on 7/31/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = NSURL(string: "https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyBavZRVigpFblBI_nYaaPuVpv5N_nQQhlw")
        
        let request = URLRequest(url: url! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                
                print(error as Any)
                
            } else {
                
                //print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
                
                do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    if jsonResult.count > 0 {
                        
                        if let items = jsonResult["items"] as? NSArray {
                            
                            for item in (items as? [[String:Any]])! {
                                
                                //print(item)
                                
                                
                                if let title = item["title"] as? String {
                                    
                                    print(title)
                                    
                                }
                                
                                if let content = item["content"] as? String  {
                                    
                                    print(content)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                } catch {
                    
                    print("error")
                }
                
            }
            
        })
        
        task.resume()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
        
            print("Show Detail")
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = "Test"
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

