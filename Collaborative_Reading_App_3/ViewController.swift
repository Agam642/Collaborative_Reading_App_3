//
//  ViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // outlets and variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // actions and methods
    @IBAction func NewBookPressed(_ sender: Any) {
        // user presses on the New Book Button 
        // redirects them to the view controller that allows them to add books
        
        
    }
    
    @IBAction func ExistingBookPressed(_ sender: Any) {
        // user presses on the Existing Book Button
        // redirects them to the view controller that allows to see the progress with that certain book
        
    }

}

