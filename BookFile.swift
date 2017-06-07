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
    
    func createBookItem (with image:UIImage) {
        
        let bookItem = Add_Books_Library(context: managedObjextContext)
        
        if bookTtitleLabel?.text != "" && authorLabel?.text != "" && pageCountLabel?.text != "" {
            bookItem.author = authorLabel?.text
            bookItem.bookTitle = bookTtitleLabel?.text
            bookItem.numberOfPages = pageCountLabel?.text
            
            do {
                try self.managedObjextContext.save()
            }catch {
                print("Could not save data \(error.localizedDescription)")
            }
            


    }
    
}
}
