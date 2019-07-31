//
//  ViewController.swift
//  Webview Demo
//
//  Created by Ishaan Sathaye on 7/30/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let url = NSURL(string: "https://www.google.com/")
        
        let request = NSURLRequest(url: url! as URL)
        
        webview.loadRequest(request as URLRequest)*/
        
        var html = "<html><head></head><body><h1>Hello World!</h1></body></html>"
        
        webview.loadHTMLString(html, baseURL: nil)
        
    }


}

