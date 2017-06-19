//
//  CalendarViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-15.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // create 3 variables to hold year , month and days and are given values in the view did load
    // each of the variables are modifiable to be used navigating to different months and years
    var year:Int = 0
    var month:Int = 0
    var day:Int = 0
    
    // creates the name of the identifier of the cell in the collection view
    let reuseIdentifier = "cell"
    
    // set up an empty string array to hold the number of cells that will be created
    var numberOfCells = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // creates a variable called date which is the current day
        let date = Date()
        let calendar = Calendar.current
        
        // iniatilizes the dateformatter built in function to set the style of how date
        // will be seen like
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        // sets the dateLabel as the current date
        dateLabel.text = "\(formatter.string(from: date))"
        
        // set the values of the year , month and day in the class main section to the current date
        year  = calendar.component(.year,  from: date)
        month = calendar.component(.month, from: date)
        day   = calendar.component(.day,   from: date)
        
        // when the program loads it will call in this function to assign the right number of cells that need to be made for the collection view of the current month
        numberOfCells = getNumberOfDaysAndDayOfWeek()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function will calculate the number of cells needed to create the calculator by getting the number of days in the month and the day of the week of the starting day of the month
    func getNumberOfDaysAndDayOfWeek() -> (Array<String>)
    {
        // set the variables date and calendar to the current values of the year and month
        let dateComponents = DateComponents(year: year, month: month )
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        
        // finds the number of days in the current month variable value
        let range = calendar.range(of: .day, in: .month, for: date)!
        let days = range.count
        
        
        // getting the start day of the month variable
        let firstDayComponents = calendar.dateComponents([.year , .month], from: date)
        let firstDay = calendar.date(from: firstDayComponents)!
        
        // getting what day of the week it is on the 1st day of the month
        let dayOfWeekComponent = Calendar.current.dateComponents([.weekday], from: firstDay).weekday
        var dayOfWeek = dayOfWeekComponent!
        
        // counter variable
        var index = 0
        // creates an empty array to hold the days displaced based on the number of days in the month and the day of the week of the 1st day in the month
        var daysDisplaced = [String]()
        
        // make a loop to add the values of the days of the month to the empty array
        for index in 1...((days + dayOfWeek)-1)
        {
            if index < dayOfWeek
            {
                // if the index is less than the day of the week it will append an empty string value to make an empty cell to the array
                daysDisplaced.append(" ")
            } else
            {
                // if the value of the index is now greater than the days of the week. That means its not an empty cell anymore and values of the days can now be assigned to the empty array
                daysDisplaced.append(String(index-(dayOfWeek - 1)))
            }
        }
        
        // prints the values of the array just to check to make sure it works
        for index in 1...daysDisplaced.count
        {
            print ("\(daysDisplaced[index-1])")
        }
        
        // returns the array of strings to the number of cells array variable to make the cells
        return (daysDisplaced)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCells.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CalendarCollectionCell
        
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.daysLabel.text = self.numberOfCells[indexPath.item]
        cell.backgroundColor = UIColor.white // make cell more visible in our example project
        
        // sets the border of the calendar to be black , with a border width of 2.0 and a corner radius of 25 to make it circle shape cell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2.0
        cell.layer.cornerRadius = 25
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        // when they click on the day it will turn red
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        // when they deselect the cell it will return the cell back to the original color of white
        cell?.backgroundColor = UIColor.white
    }

    
    


    @IBAction func nextMonth(_ sender: Any) {
        // user clicks on the next month button
        if month == 12
        {
            // if the month is equal to 12 , it will reset the month value to 1 , the 1st month January
            month = 1
            // and it will add 1 to the year variable
            year = year + 1
        } else
        {
            // if the months is still not 12 , December , it will just add 1 normally to the month variable
            month = month + 1
        }
        
        print(year, month, day)
        
        numberOfCells = getNumberOfDaysAndDayOfWeek()
        
        self.collectionView!.reloadData()
        
    }
    
    @IBAction func prevMonth(_ sender: Any) {
        // user clicks on the previous month button
        if month == 1
        {
            // if the month is equal to 1 , January , it will reset the value of month back to 12 , December
            month = 12
            // and it will subtract 1 to the year variable
            year = year - 1
        } else
        {
            // if the month is still not 1 , Janaury , it will just subtract 1 normally to the month variable
            month = month - 1
        }
        
        print(year, month, day)
        
        numberOfCells = getNumberOfDaysAndDayOfWeek()
        
        self.collectionView!.reloadData()
        
    }
    
    
}
