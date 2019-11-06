//
//  ViewController.swift
//  How Many Fingers??
//
//  Created by Ishaan Sathaye on 6/25/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var guess: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBAction func guessButton(_ sender: Any) {
        var randomNumber:Int? = Int(arc4random_uniform(6))
        var guessInt:Int? = Int(guess.text!)
        
        if guessInt != nil{
            if guessInt == randomNumber{
                resultLabel.text = "CORRECT!"
            }else{
                resultLabel.text = "Nope, it was \(randomNumber!)"
            }
        }else{
            resultLabel.text = "Enter a #!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }


}

