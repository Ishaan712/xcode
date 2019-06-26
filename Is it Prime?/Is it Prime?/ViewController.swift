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
        let entered:Int! = Int(number.text!)
        
        if entered != nil {
            if entered == 1{
                resultLabel.text = "Not a prime!"
            }
            if entered != 2 && entered != 1 {
                for i in 2..<entered {
                    if entered % i == 0 {
                        resultLabel.text = "Not a prime!"
                    }
                }
            }else{
                resultLabel.text = "PRIME!"
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

