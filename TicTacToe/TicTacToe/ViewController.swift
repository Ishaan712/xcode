//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ishaan Sathaye on 7/3/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        var image = UIImage(named: "cross.png")
        
        (sender as AnyObject).setImage(image, for: .normal) // Sender is the UI element that has been tapped
        
        print((sender as AnyObject).tag as Any)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

