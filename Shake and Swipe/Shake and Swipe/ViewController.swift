//
//  ViewController.swift
//  Shake and Swipe
//
//  Created by Ishaan Sathaye on 7/29/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        // add a swipe right gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        // add a swipe left gesture
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // add a swipe up gesture
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    // if user shakes the device (movmeent of the device stops)
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            
            print("User shook the device")
            
        }
        
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) { // what happens when a swipe is done
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer { // put question mark in case of gesture not being a swipe
            
            switch swipeGesture.direction { // use cases
                
            case UISwipeGestureRecognizer.Direction.right: // if the case is right
                
                print("User swiped right")
            
            case UISwipeGestureRecognizer.Direction.left: // if the case is left
                
                print("User swiped left")
            
            case UISwipeGestureRecognizer.Direction.up: // if the case is up
                            
                print("User swiped up")
                
            default: // nothing else then do this as the default
                
                break // stops the code and does nothing
                
            }
        
        }
        
    }

}

