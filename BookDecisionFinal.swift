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
    
    @IBOutlet weak var bookTitle: UITextField!    
   
    @IBOutlet weak var authorTitle: UITextField!
    
    @IBOutlet weak var pagesTitle: UITextField!
    
    var images = [Add_Books_Library]()
    var managedObjextContext: NSManagedObjectContext!
    //let image = info[UIImagePickerControllerOriginalImage] as? UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bookItem = Add_Books_Library(context: managedObjextContext)
        // Do any additional setup after loading the view.
       
        bookTitle.text = bookItem.bookTitle
        authorTitle.text = bookItem.author
        pagesTitle.text = bookItem.numberOfPages
        bookCover?.image = UIImage(data: bookItem.bookCover! as Data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
