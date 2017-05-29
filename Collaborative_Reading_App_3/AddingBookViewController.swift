//
//  AddingBookViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din on 2017-04-15.
//  Copyright © 2017 Saif Al-Din. All rights reserved.
//

import UIKit
import CoreData

class AddingBookViewController: UIViewController {
    
    //variables and outlets
    @IBOutlet weak var BookTitleTextField: UITextField!
    
    @IBOutlet weak var PageCountTextField: UITextField!
    
    @IBOutlet weak var AuthorNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // actions and methods
    
    @IBAction func BookTitleTextFieldChanged(_ sender: Any) {
    }
    
    @IBAction func PageCountTextFieldChanged(_ sender: Any) {
    }
    
    
    @IBAction func AuthorNameTextFieldChanged(_ sender: Any) {
    }
}
