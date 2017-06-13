//
//  CalendarViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-05-31.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // creates a variable called date that is assigned the value of the current date
        let date = Date()
        
        // activates the DateFormatter class which allows access to the current date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        // sets the label text of Date Label to be the formatter variable which already got the date from the dateformatter
        DateLabel.text = "\(formatter.string(from: date))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    Calendar will be created using a UICollectionView with the current month and the number of days in a month being used from activating the Date Class and calculating the intervals of days from the beginning of the month to the end of the month
     // mumber of days in the month but be calculated for each month as each month will have a different number of days and a different day that it starts on 
     
     // getting the range of the days in a month , this is done to find the number of cells that are needed
     let dateComponents = DateComponents(year: 2015, month: 7)
     let calendar = Calendar.current
     let date = calendar.date(from: dateComponents)!
     
     let range = calendar.range(of: .day, in: .month, for: date)!
     let numDays = range.count
     print(numDays) // 31
     
     // getting the day of the week to be able to use in displaying the days on the correct
     day of the week
     extension Date {
     func dayNumberOfWeek() -> Int? {
     return Calendar.current.dateComponents([.weekday], from: self).weekday
     }
     }
     
     // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
     print(Date().dayNumberOfWeek()!) // 4
    
    */

    @IBAction func toAchievement(_ sender: Any) {
        
        // links to the pop up view controller
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "achievementPopUp") as! AchievementPopUpViewController
        // adds the pop up view controller to itself
        self.addChildViewController(popOverVC)
        // displays the pop up view controller
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
}
