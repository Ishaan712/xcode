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
    
    /*override func viewDidLayoutSubviews() {
        
        //pandaImage.center = CGPoint(x: pandaImage.center.x - 400, y: pandaImage.center.y) // slides in from the left animation
        
        //pandaImage.alpha = 0 // fades the sprite in animation
     
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, animations: { () -> Void in // closure so need SELF before actions
            
            //self.pandaImage.center = CGPoint(x: self.pandaImage.center.x + 400, y: self.pandaImage.center.y) // slides in from left animation
            
            //self.pandaImage.alpha = 1 // fades the sprite in animation
            
            self.pandaImage?.transform = CGAffineTransform(scaleX: 0.0, y: 0.0) //decrease size animation
            
        }){ (_ finished: Bool) in
            
            UIView.animate(withDuration: 1, animations: {
                
                self.pandaImage?.transform = CGAffineTransform(scaleX: 2, y: 2)// increase size animation
                
                self.pandaImage?.center = CGPoint(x: self.pandaImage.center.x - 30, y: self.pandaImage.center.y) // move image so it fits in the area
            })
        }
        
    }*/

}

