//
//  AvatarSelectionViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-26.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class AvatarSelcetion: UIViewController {
    //create outlet for the label which will display the users name
    @IBOutlet weak var namelbl: UILabel!
    
    //sets the variable passedData as an empty string
    var passedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Prints the message in the viewcontroller
        namelbl.text = "Hi " + passedData + ", Please Select an Avatar"
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
    
}
