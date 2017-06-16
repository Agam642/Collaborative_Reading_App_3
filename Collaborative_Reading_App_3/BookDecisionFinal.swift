
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
    var managedObjextContext: NSManagedObjectContext!
    
    var passedData = ""
    var passedAuthor = ""
    var passedPages = ""
    
    func loadData(){
        
        let bookRequest:NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        
        do {
            images = try managedObjextContext.fetch(bookRequest)
           //self.collectionView!.reloadData()
            
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTitleField.text = passedData
        bookAuthorField.text = passedAuthor
        bookPagesField.text = passedPages
        
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

