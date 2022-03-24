//
//  ViewController.swift
//  Cat Years
//
//  Created by Ishaan on 7/6/16.
//  Copyright © 2016 Ishaan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myButton(sender: AnyObject) {
    
        var enteredAge = Int(age.text!)
        
        if enteredAge != nil {
        
            var catYears = enteredAge! * 7
        
            resultLabel.text = "Your cat is " + String(catYears) + " in cat years "
        
        } else {
            
            resultLabel.text = "Please enter a number"
        }
    }
    
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

