//
//  UserInputVC.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-18.
//  Copyright © 2017 Saif Al-Din Ali. All rights reserved.
//

import UIKit

class UserInputVC: UIViewController, UITextFieldDelegate {

    let nextNum = "numNext"
    
    @IBOutlet weak var hoursField: UITextField!
    
    @IBOutlet weak var minutesField: UITextField!
    
    @IBOutlet weak var secondsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hoursField.delegate = self
        self.minutesField.delegate = self
        self.secondsField.delegate = self
    }
    
    var hoursResult : Int!
    var minutesResult : Int!
    var secondsResult : Int!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    //The button to press to pass data from one view controller to the next 
    @IBAction func NextButton(_ sender: Any) {
        
        hoursResult = Int(hoursField.text!)
        minutesResult = Int(minutesField.text!)
        secondsResult = Int(secondsField.text!)
        
        self.performSegue(withIdentifier: nextNum, sender: nil)
    }
    
    //Passes the User Input to View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == nextNum {
            let destination = segue.destination as! ViewController
            if (secondsResult != nil) && (minutesResult != nil) && (hoursResult != nil) {
            destination.selectedSecs = secondsResult
            destination.selectedMins = minutesResult
            destination.selectedHours = hoursResult
            }
        }
    }

    

}
