//
//  SecondViewController.swift
//  To Do List
//
//  Created by Ishaan Sathaye on 6/27/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        
        toDoList.append(item.text!)
        
        item.text = ""
        
        UserDefaults.standard.setValue(toDoList, forKey: "toDoList") //stores the data or the array
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.item.delegate = self
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() 
        
        return true
    }

}

