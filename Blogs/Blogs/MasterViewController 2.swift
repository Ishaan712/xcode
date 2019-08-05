//
//  MasterViewController.swift
//  Blogs
//
//  Created by Ishaan Sathaye on 7/31/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var managedObjectContext:NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
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
                            
                            let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Posts")
                            
                            fetchRequest1.returnsObjectsAsFaults = false
                            
                            do {
                                
                                let results = try context.fetch(fetchRequest1)
                                
                                if results.count > 0 {
                                    
                                    for result in results {
                                        
                                        context.delete(result as! NSManagedObject)
                                        
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving")
                                        }
                                        
                                    }
                                }
                                
                            } catch {
                                
                                print("error")
                                
                            }
                            
                            for item in (items as? [[String:Any]])! {
                                
                                if let title = item["title"] as? String {
                                    
                                    if let content = item["content"] as? String  {
                                        
                                        let newPost:NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Posts", into: context)
                                        
                                        newPost.setValue(title, forKey: "title")
                                        newPost.setValue(content, forKey: "content")
                                        
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving")
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    self.tableView.reloadData()
                    
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
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = fetchedResultsController.object(at: indexPath)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
            }
            
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        configureCell(cell, atIndexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        let object = self.fetchedResultsController.object(at: indexPath as IndexPath) as! NSManagedObject
        
        cell.textLabel!.text = (object.value(forKey: "title")! as AnyObject).description
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: "Posts", in: self.managedObjectContext!)
        fetchRequest.entity = entity
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    var _fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>? = nil
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
}

