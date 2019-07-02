//
//  ViewController.swift
//  Animations
//
//  Created by Ishaan Sathaye on 7/1/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pandaImage: UIImageView!
    
    var counter = 1
    
    @IBAction func updateImage(_ sender: Any) {
        
        pandaImage.image = UIImage(named: "frame\(counter).png")
        
        counter += 1
        
        if counter == 8 {
            
            counter = 1
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

