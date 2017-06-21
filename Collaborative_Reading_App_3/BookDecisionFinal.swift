
//
//  BookDecisionFinal.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-07.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class BookDecisionFinal: UIViewController {
    
    
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitleField: UILabel!
    @IBOutlet weak var bookAuthorField: UILabel!
    @IBOutlet weak var bookPagesField: UILabel!
    
    
    var images = [Add_Books_Library]()
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    let managedObjectContext2 = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Add_Books_Library",
                                       in: managedObjectContext)
        
        let request: NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        request.entity = entityDescription
        
        do {
            var results = try managedObjectContext.fetch(request as!NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                let match = results[results.count-1] as! NSManagedObject
               
                //Fetches the lebel values as the core data strings
                bookTitleField.text = match.value(forKey: "bookTitle") as? String
                print(bookTitleField.text)
                
                
                bookAuthorField.text = match.value(forKey: "author") as? String
                print(bookAuthorField.text)
                
                
                bookPagesField.text = match.value(forKey: "numberOfPages") as? String
                print(bookPagesField.text)
                
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }
        
        //Used for the book cover
        
        let entityDescription2 =
            NSEntityDescription.entity(forEntityName: "Add_Books_Library",
                                       in: managedObjectContext2)
        
        //Fetches the book data from Core Data
        let request2: NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        request2.entity = entityDescription2
        
        do {
            var results2 = try managedObjectContext2.fetch(request2 as!NSFetchRequest<NSFetchRequestResult>)
            
            if results2.count > 0 {
                let match2 = results2[results2.count-1] as! NSManagedObject
                
                let iimage = match2.value(forKey: "bookCover") as? NSData
                
                bookCover.image = UIImage(data: iimage! as Data)
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }
    
    }
}
