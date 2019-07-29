//
//  ViewController.swift
//  Music
//
//  Created by Ishaan Sathaye on 7/28/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var isPlaying = false
    
    @IBOutlet weak var myToolbar: UIToolbar!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet var playPauseButton: UIBarButtonItem!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        player.volume = sliderValue.value
        
    }
    
    @IBAction func playandpause(_ sender: Any) {
        
        if !isPlaying {
            
            setOnPlay()
            
        } else {
            
            setOnPause()
            
        }
    
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        player.stop()
        
        player.currentTime = 0 // reset music to beginnning
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        
        let audioPath = Bundle.main.path(forResource: "lucidDreams", ofType: "mp3")!
                
        let _ : NSError? = nil
                
        player = try! AVAudioPlayer(contentsOf: NSURL(string: audioPath)! as URL)
        
        //player.pause()
        
    }
    
    func setOnPause() { // function to set to Pause the music
            
        var items = self.myToolbar.items // declare the items in the toolbar
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(ViewController.playandpause(_:))) // change the first item in the toolbar to play while paused ----- selector is the action which is the playandpause button tapped
        player.pause() // pause the music
        isPlaying = false // set the state of the music to false
        self.myToolbar.setItems(items, animated: true) // show the new set of toolbar items
            
    }
    
    func setOnPlay() {
        
        var items = self.myToolbar.items
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.pause, target: self, action: #selector(ViewController.playandpause(_:)))
        player.play()
        isPlaying = true
        self.myToolbar.setItems(items, animated: true)
        
    }

}

