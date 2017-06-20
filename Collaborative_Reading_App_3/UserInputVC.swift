//
//  UserInputVC.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-18.
//  Copyright © 2017 Saif Al-Din Ali. All rights reserved.
//

import UIKit
import CoreData

class UserInputVC: UIViewController, UITextFieldDelegate {
    
    let nextNum = "numNext"
    
    @IBOutlet weak var hoursField: UITextField!
    
    @IBOutlet weak var minutesField: UITextField!
    
    @IBOutlet weak var secondsField: UITextField!
    
    @IBOutlet weak var nextbutton: UIButton!
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hoursField.delegate = self
        self.minutesField.delegate = self
        self.secondsField.delegate = self
        
        if hoursField.text!.isEmpty || minutesField.text!.isEmpty || secondsField.text!.isEmpty {
            nextbutton.isEnabled = false
        }
    }
    
    var hoursResult : Int16!
    var minutesResult : Int16!
    var secondsResult : Int16!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if hoursField.text!.isEmpty || minutesField.text!.isEmpty || secondsField.text!.isEmpty {
            nextbutton.isEnabled = true
        } else {
            nextbutton.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    //The button to press to pass data from one view controller to the next
    @IBAction func NextButton(_ sender: Any) {
        
        hoursResult = Int16(hoursField.text!)
        minutesResult = Int16(minutesField.text!)
        secondsResult = Int16(secondsField.text!)
        
        self.performSegue(withIdentifier: nextNum, sender: nil)
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "TimerInfo",
                                                           in: managedObjectContext)
        
        let contact = TimerInfo(entity: entityDescription!,
                               insertInto: managedObjectContext)
        
        contact.hours = hoursResult
        contact.minutes = minutesResult
        contact.seconds = secondsResult
        
        do {
            try managedObjectContext.save()
            print("Saved Time")
            print(contact.hours, contact.minutes, contact.seconds)
            
        } catch {
            print("Error")
        }

    }
    
    //Passes the User Input to View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == nextNum {
            let destination = segue.destination as! TimerViewController
            if (secondsResult != nil) && (minutesResult != nil) && (hoursResult != nil) {
                destination.selectedSecs = secondsResult
                destination.selectedMins = minutesResult
                destination.selectedHours = hoursResult
            }
        }
    }

}
