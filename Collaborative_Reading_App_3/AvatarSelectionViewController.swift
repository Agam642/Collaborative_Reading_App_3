//
//  AvatarSelectionViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-26.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class AvatarSelectionViewController: UIViewController {
    //create outlet for the label which will display the users name
    @IBOutlet weak var namelbl: UILabel!
    
    //Action for each button pressed (avater chosen)
    @IBAction func touchWolf(_ sender: Any) {
    }
    
    @IBAction func touchBear(_ sender: Any) {
    }
    
    @IBAction func touchSheep(_ sender: Any) {
    }
    
    @IBAction func touchCow(_ sender: Any) {
    }
    
   
    @IBAction func touchPig(_ sender: Any) {
    }
    
    @IBAction func touchDolphin(_ sender: Any) {
    }
    
    @IBAction func touchElephant(_ sender: Any) {
    }
    
    @IBAction func touchFlamingo(_ sender: Any) {
    }
    
    @IBAction func touchFox(_ sender: Any) {
    }
    
    @IBAction func touchHippo(_ sender: Any) {
    }
    
    @IBAction func touchJellyfish(_ sender: Any) {
    }
    
    @IBAction func touchPenguin(_ sender: Any) {
    }
    
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
