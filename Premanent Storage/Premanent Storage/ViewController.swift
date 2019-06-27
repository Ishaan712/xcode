//
//  ViewController.swift
//  Premanent Storage
//
//  Created by Ishaan Sathaye on 6/26/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // UserDefaults.standard.setValue("Ishaan", forKey: "name") //Stores the data

        let name = UserDefaults.standard.object(forKey: "name")! //Retrieves data
        
        print(name)
        
        
        var arr = [1, 2, 3]
        
        //UserDefaults.standard.setValue(arr, forKey: "array")
        
        let recallArray = UserDefaults.standard.object(forKey: "array") as! NSArray
        
        print(recallArray[2])
        
    }


}

