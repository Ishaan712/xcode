//
//  ViewController.swift
//  Stopwatch
//
//  Created by Ishaan Sathaye on 6/26/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var count = 0
    
    
    @objc func updateTime(sender: Any?) {
       
        count += 1
        
        currentTime.text = "\(count)"
    }
    
    
    @IBOutlet var currentTime: UILabel!
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        count = 0
        currentTime.text = "0"
    }
    
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

