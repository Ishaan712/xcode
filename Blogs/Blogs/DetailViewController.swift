//
//  DetailViewController.swift
//  Blogs
//
//  Created by Ishaan Sathaye on 7/31/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    func configureView() {
        // Update the user interface for the detail item.
        
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

