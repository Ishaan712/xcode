//
//  ViewController.swift
//  Advanced Segues
//
//  Created by Ishaan Sathaye on 7/12/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

var rowCounter:Int = 0

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(rowCounter)
        
        resultLabel.text = "Row \(rowCounter)"
        
    }


}

