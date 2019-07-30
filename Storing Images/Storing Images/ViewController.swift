//
//  ViewController.swift
//  Storing Images
//
//  Created by Ishaan Sathaye on 7/30/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var glitch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        
        /*
        let url = NSURL(string: "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/11/Glitch-Typography-Featured-Image-01.jpg")
        
        let urlRequest = NSURLRequest(url: url! as URL)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest as URLRequest, queue: OperationQueue.main, completionHandler: {respnose,data,error in
            
            if error != nil {
                
                print("There was an error")
                
            } else {
                
                let image = UIImage(data: data!)
                
                // no longer need this because the file will be saved
                //self.glitch.image = image
                
                var documentsDirectory:String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [AnyObject] // return an array of the paths of folders to store the documents in
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/glitch.jpg"
                    
                    FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil) // save image in the path
                    
                    self.glitch.image = UIImage(named: savePath)
                    
                }
                
            }
            
        })
 */
        // see if the image was saved in the path
        var documentsDirectory:String?
        
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [AnyObject] // return an array of the paths of folders to store the documents in
        
        if paths.count > 0 {
            
            documentsDirectory = paths[0] as? String
            
            var savePath = documentsDirectory! + "/glitch.jpg"
            
            self.glitch.image = UIImage(named: savePath)
            
        }
        
    }


}

