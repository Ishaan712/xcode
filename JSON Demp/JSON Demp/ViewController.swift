//
//  ViewController.swift
//  JSON Demp
//
//  Created by Ishaan Sathaye on 7/30/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://ip-api.com/json")
        
        let task = URLSession.shared.dataTask(with: url!) {
            
            (data, response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    print(jsonResult)
                    
                    print(jsonResult["country"]!)
                    
                } catch {
                    
                    print("error")
                }
                
            }
            
            
        }
        
        task.resume()
        
    }
    
    
}

