//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Ishaan Sathaye on 7/29/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var sounds  = ["bassDrumRoll", "bellTree", "bongoAccent", "bowandarrow", "crashWithEcho", "explosion"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        
        
    }
    
    // if user shakes the device (movmeent of the device stops)
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            var fileLocation = Bundle.main.path(forResource: sounds[randomNumber], ofType: "mp3")!
            
            player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: fileLocation) as URL)
            
            player.play()
            
        }
        
    }

}

