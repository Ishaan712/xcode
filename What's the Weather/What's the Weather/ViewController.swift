//
//  ViewController.swift
//  Weather
//
//  Created by Ishaan Sathaye on 6/28/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userCity: UITextField!
    
    @IBAction func findWeather(_ sender: Any) {
        
        var url = URL(string: "https://www.weather-forecast.com/locations/" + (userCity.text?.replacingOccurrences(of: " ", with: "-"))! + "/forecasts/latest")
        
        if url != nil {
            
            let task  = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                var weather = ""
                
                if error == nil {
                    
                    var urlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! NSString
                    
                    print(urlContent)
                    
                    var urlContentArray = urlContent.components(separatedBy: "<span class=\"phrase\">")
                    
                    if(urlContentArray.count > 0) {
                        
                        var weatherArray = urlContentArray[1].components(separatedBy: "</span>")
                        
                        weather = weatherArray[0]
                        
                        weather = weather.replacingOccurrences(of: "&deg;", with: "º")
                    } else {
                        
                        urlError = true
                        
                    }
                    
                } else {
                    
                    urlError = true
                    
                }
                
                DispatchQueue.main.async { // runs this code when information present instead of waiting for queue
                    
                    if urlError == true {
                        
                        self.showError()
                        
                    } else {
                        
                        self.resultLabel.text = "\(weather)"
                        
                    }
                    
                }
                
            })
            
            task.resume() //initiates the URL session
            
        } else {
            
            showError()
            
        }
        
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    func showError() {
        
        resultLabel.text = "Was not able to find the weather for " + userCity.text! + ". Please try again."
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userCity.delegate = self
        
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

