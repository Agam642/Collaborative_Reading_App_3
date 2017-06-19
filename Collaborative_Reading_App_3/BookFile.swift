//
//  BookFile.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-06-05.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class BookFile: UIViewController {
    
    @IBOutlet weak var bookTtitleLabel: UITextField!
    
    @IBOutlet weak var pageCountLabel: UITextField!
    
    @IBOutlet weak var authorLabel: UITextField!
    
    var books = [Add_Books_Library]()
    
    var managedObjextContext: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        //bookTtitleLabel.text = books.bookTitle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBook(_ sender: Any) {
        //performs a segue from name view controller to the avater selection
        performSegue(withIdentifier: "goToNext", sender: self)
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Add_Books_Library",
                                                           in: managedObjextContext)
        
        let contact = (entity: entityDescription!,
                               insertInto: managedObjextContext)
        
        contact.name = nameInput.text!
        
        do {
            try managedObjextContext.save()
            print("Saved Name")
            
        } catch {
            print("Error")
        }
    }
    
    
    
}
