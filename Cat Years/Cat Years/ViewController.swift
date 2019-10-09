//
//  ViewController.swift
//  Cat Years
//
//  Created by Ishaan Sathaye on 6/25/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func myButton(_ sender: Any) {
        
        let enteredAge:Int? = Int(age.text!)
        
        if enteredAge != nil {
            let catYears = enteredAge! * 7
            
            resultLabel.text = "Your cat is \(catYears) in cat years"
        }
        else {
            resultLabel.text = "Enter cat's age!"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

