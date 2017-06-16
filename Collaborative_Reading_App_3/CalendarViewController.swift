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
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    // creates 42 cells , 7x7 to hold the days , 7x7 is used as this will hold at least 31 days 
    // and as the grid would look nicer with a 7x7 grid than using a non square grid
    var numberOfCells = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"]
    
    
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
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // creates a variable called date which is the current day
        let date = Date()
        //creates a variable called calendar which is the current calendar and year
        let calendar = Calendar.current
        
        // iniatilizes the dateformatter built in function to set the style of how date
        // will be seen like
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        // sets the dateLabel as the current date
        dateLabel.text = "\(formatter.string(from: date))"
        
        // getting the start of the month
        let firstDayComponents = calendar.dateComponents([.year, .month], from: date)
        let firstDay = calendar.date(from: firstDayComponents)!
        
        // getting what day of the week it is on the 1st day of the month
        let dayOfWeekComponent = Calendar.current.dateComponents([.weekday], from: firstDay).weekday
        
        // calculating the start and end of the month
        let interval = calendar.dateInterval(of: .month, for: firstDay)!
        
        // calculates the different between the start and end of the month
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        print(days)
        
        
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

}
