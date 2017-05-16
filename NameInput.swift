//
//  NameInput.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-19.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class NameInput: UIViewController {
    
    //outlet for the text field
    @IBOutlet weak var nameInput: UITextField!
    
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
    
    //action for the button
    @IBAction func goToNext(_ sender: UIButton) {
        //performs a segue from name view controller to the avater selection
        performSegue(withIdentifier: "goToNext", sender: self)
    }
    
    //func that allows passing data with the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! AvatarSelcetion
        //sets the variable passedData (an empty string from avaterselction swift file) as the text inputted
        destination.passedData = nameInput.text!
    }
}
