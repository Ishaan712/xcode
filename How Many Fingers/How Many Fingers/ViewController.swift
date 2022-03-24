//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Ishaan on 7/8/16.
//  Copyright © 2016 Ishaan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guess: UITextField!
    
    @IBAction func guessButton(sender: AnyObject) {
        
        var randomNumber = arc4random_uniform(6)
        
        var guessInt = Int(guess.text!)
        
        if guessInt != nil {
            
            if Int(randomNumber) == guessInt{
                
                resultLabel.text = "Fantastic, that is CORRECT"
            
            } else {
                
               resultLabel.text = "Incorrect, I was holding up \(randomNumber) fingers"
            }
        
        } else {
            
            resultLabel.text = "Please enter a number 0-5"
        
        }
        
        print(guess.text)
        
    }
    
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

