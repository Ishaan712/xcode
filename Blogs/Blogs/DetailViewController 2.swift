//
//  DetailViewController.swift
//  Blogs
//
//  Created by Ishaan Sathaye on 7/31/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var webView: UIWebView!
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = detailItem {
            
            if let wv = webView {
                
                wv.loadHTMLString(detail.content!.description, baseURL: nil)

            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

