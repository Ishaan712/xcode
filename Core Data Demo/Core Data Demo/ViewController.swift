//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Ishaan Sathaye on 7/29/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // setup code to access CoreData
        var appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext // set up context to work with the database
        
        
        // make a new user in the database
        var newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
        
        newUser.setValue("Ishaan", forKey: "username")
        newUser.setValue("hello123", forKey: "password")
        
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
        
        
        //fetch data from the database
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            
            if result.count > 0 {
                
                print(result.count)
                
                for item: AnyObject in result as! [NSManagedObject] {
                    
                    print(item.value(forKey: "password")!) // to access a specific item in the database
                    
                }
                
            } else {
                
                print("No reuslts!")
                
            }
            
        } catch {
            print("Failed")
        }
        
    }


}

