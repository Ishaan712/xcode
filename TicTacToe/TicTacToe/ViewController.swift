//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ishaan Sathaye on 7/3/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = circle, 2 = cross, 0 = nothing
    
    var activePlayer = 1 // which player starts
    
    var tie = 0
    
    var count = 0
    
    var gameActive = true // is game being played
    
    var gameState = [0,0,0,0,0,0,0,0,0] // create array for board sections
    
    var winnings = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]] // combinations for winning
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(_ sender: Any) { // if user wants to play again; reset everything
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        count = 0
        
        tie = 0
        
        playAgainButton.isHidden = true
        
        resultLabel.isHidden = true
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)
        
        resultLabel.center = CGPoint(x: resultLabel.center.x - 400, y: resultLabel.center.y)
        
        var button:UIButton
        
        for i in 0..<9 {
            
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, for: .normal)
            
        }
        
    }
    
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if gameState[(sender as AnyObject).tag] == 0 && gameActive == true {
            
            var image = UIImage()
            
            gameState[(sender as AnyObject).tag] = activePlayer // sets the element in the array as either 1 or 2 depending on the player
            
            if activePlayer == 1 {
                
                image = UIImage(named: "circle.png")!
                
                activePlayer = 2
                
            } else {
                
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
                
            }
            
            (sender as AnyObject).setImage(image, for: .normal) // Sender is the UI element that has been tapped; in this case a button
            
            for combination in winnings { // check wins
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = " "
                    
                    if gameState[combination[0]] == 1 {
                        
                        labelText = "Circle Wins!"
                        
                    } else if gameState[combination[0]] == 2 {
                        
                        labelText = "Cross Wins!"
                        
                    }
                    
                    resultLabel.text = labelText
                    
                    resultLabel.textColor = UIColor.green
                    
                    playAgainButton.isHidden = false
                    
                    resultLabel.isHidden = false
                    
                    UIView.animate(withDuration: 0.5, animations: { () -> Void in // show winning animation
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 400, y: self.playAgainButton.center.y)
                        
                        self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 400, y: self.resultLabel.center.y)
                        
                        
                    })
                    
                    gameActive = false
                    
                }
                
            }
            // check tie game
            count = 0
            
            for element in 0..<9 {
                
                if gameState[element] == 1 || gameState[element] == 2 {
                    
                    count += 1
                    
                }
                
            }
            
            
            if count == 9 {
                
                playAgainButton.isHidden = false
                
                resultLabel.text = "Tie!"
                
                resultLabel.textColor = UIColor.red
                
                resultLabel.isHidden = false
                
                UIView.animate(withDuration: 0.5, animations: { () -> Void in // show tie animation
                    
                    self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 400, y: self.resultLabel.center.y)
                    
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 400, y: self.playAgainButton.center.y)
                    
                    
                })
                
                gameActive = false
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainButton.isHidden = true
        
        resultLabel.isHidden = true
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)
        
        resultLabel.center = CGPoint(x: resultLabel.center.x - 400, y: resultLabel.center.y)
        
    }
    
}

