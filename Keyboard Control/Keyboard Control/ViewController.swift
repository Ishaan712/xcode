//
//  ViewController.swift
//  Keyboard Control
//
//  Created by Ishaan Sathaye on 6/26/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //also need this to close keyboard using "return" 

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var entered: UITextField!
    @IBAction func button(_ sender: Any) {
        
        resultLabel.text = entered.text
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.entered.delegate = self //need this in order for the textfield to control the viewController
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // CLOSES THE KEYBOARD
        //WHEN TOUCHED OUTSIDE THE KEYBOARD

        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //WHEN RETURN IS PRESSED
        
        textField.resignFirstResponder() //CLOSE THE KEYBOARD
        
        return true
    }


}

