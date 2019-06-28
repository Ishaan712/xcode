//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Ishaan Sathaye on 6/27/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.espn.com")
        
        let task = URLSession.shared.dataTask(with: url!) {
            
            (data, response, error) in //retrieves the data from the website
            
            if error != nil { //checks for errors and if there are none then display the data-- which is the web content
                
                print(error!)
                
            } else {
                
                if let usableData = data {
                    
                    var urlContent = NSString(data: usableData, encoding: String.Encoding.utf8.rawValue) // converts the data in a form that is readable
                    
                    DispatchQueue.main.async { //runs the code by this part first and decreases the delay by loading content faster: called asyncrounous code
                        
                        self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                        
                    }
                }
            }
        }
        
        task.resume()
        
    }


}

///////// New
/*import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}*/

