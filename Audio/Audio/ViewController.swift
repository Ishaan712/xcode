//
//  ViewController.swift
//  Audio
//
//  Created by Ishaan Sathaye on 7/18/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func play(_ sender: Any) { // play audio
        
        var audioPath = Bundle.main.path(forResource: "beethoven-2-1-1-pfaul", ofType: "mp3")!
        
        var error : NSError? = nil
        
        player = try! AVAudioPlayer(contentsOf: NSURL(string: audioPath)! as URL)
        
        if error == nil {
            
            player.play()
            
        } else {
            
            print(error)
            
        }
        
    }
    
    @IBAction func pause(_ sender: Any) { // pause audio
        
        player.pause()
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) { // volume change
        
        player.volume = sliderValue.value // 0-1 both of them
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

