//
//  ViewController.swift
//  Is it Prime?
//
//  Created by Ishaan Sathaye on 6/25/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var number: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        
        var entered:Int! = Int(number.text!)
        
        if entered != nil {
            
            var isPrime = true
            
            if entered <= 1{
                isPrime = false
            }
            
            if entered != 2 && entered != 1{
                for i in 2..<entered {
                    if entered % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                
                resultLabel.text = "PRIME!"
            }
            else if isPrime == false {
                
                resultLabel.text = "Not a prime!"
            }
            
        } else {
            resultLabel.text = "Please enter #"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

