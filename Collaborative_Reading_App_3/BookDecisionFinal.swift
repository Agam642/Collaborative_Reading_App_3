
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
    
    var passedData = ""
    var passedAuthor = ""
    var passedPages = ""
    
    
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

    
    /*
    override func viewWillAppear(_ animated: Bool) {
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Add_Books_Library",
                                       in: managedObjextContext)
        
        let request: NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        request.entity = entityDescription
        
        do {
            var results = try managedObjextContext.fetch(request as!NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                let match = results[results.count-1] as! NSManagedObject
                
                bookTitleField.text = match.value(forKey: "bookTitle") as? String
                
                print(bookTitleField.text)
                
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }
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
 */
    
}
}
