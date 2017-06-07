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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let bookItem = Add_Books_Library(context: managedObjextContext)
        // Do any additional setup after loading the view.
        //bookItem.bookCover = NSData(data: UIImageJPEGRepresentation(bookCover.image!, 0.3)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            bookCover.image = image
            //myImageView.image = images.
        } else {
            //Diplay error message
        }
        
        self.dismiss(animated: true, completion: nil)
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }

}
