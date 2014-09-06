//
//  ViewController.swift
//  SwiftFollowExample
//
//  Created by Sachin Kesiraju on 6/12/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func followPressed (sender:AnyObject)
    {
        var twitterFollow:SwiftFollow = SwiftFollow()
        twitterFollow.follow("sachinkesiraju")
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

