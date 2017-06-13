
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
        
        loadData()
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let bookItem = Add_Books_Library(context: managedObjextContext)
        
        // Do any additional setup after loading the view.
        //bookItem.bookCover = NSData(data: UIImageJPEGRepresentation(bookCover.image!, 0.3)!)
        //bookCover.image = UIImageJPEGRepresentation(f, 1)
        bookTitleField?.text = bookItem.bookTitle
        bookAuthorField?.text = bookItem.author
        bookPagesField?.text = bookItem.numberOfPages
        print(bookItem.bookTitle)
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

