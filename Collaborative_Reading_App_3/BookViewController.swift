//
//  BookViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-26.
//  Copyright © 2017 Saif Al-Din Ali. All rights reserved.
//

import UIKit
import CoreData

class BookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var BackButton: UIBarButtonItem!
    
    var books = [Add_Books_Library]()
    
    var managedObjextContext: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconImageView = UIImageView(image: UIImage(named: "Shape"))
        self.navigationItem.titleView = iconImageView
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        loadData()
        
    }
    
    func loadData(){
        
        let bookRequest:NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        
        do {
            books = try managedObjextContext.fetch(bookRequest)
            self.collectionView!.reloadData()
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BookViewCell
        
        let entityDescription2 =
            NSEntityDescription.entity(forEntityName: "Add_Books_Library",
                                       in: managedObjextContext)
        
        let request2: NSFetchRequest<Add_Books_Library> = Add_Books_Library.fetchRequest()
        request2.entity = entityDescription2
        

        
        do {
            var results2 = try managedObjextContext.fetch(request2 as!NSFetchRequest<NSFetchRequestResult>)
            
            if results2.count > 0 {
                let match2 = results2[results2.count-1] as! NSManagedObject
                
                let iimage = match2.value(forKey: "bookCover") as? NSData
                
                cell.imgCell.image = UIImage(data: iimage! as Data)
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }
        
        //let holdToDelete = UILongPressGestureRecognizer(target: self, action: "longPressDelete:")
        //holdToDelete.minimumPressDuration = 1.00
        //cell.addGestureRecognizer(holdToDelete)
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
        //let longPres = UILongPressGestureRecognizer(target: self, action: #selector(self.activateDeletionMode))
        //longPres.minimumPressDuration = 0.5
        //seconds
        //longPres.delegate = self
        //self.collectionView?.addGestureRecognizer(longPres)
        
        //performs a segue from name view controller to the avater selection
        self.performSegue(withIdentifier: "goToNextStoryBoard", sender: self)
    }
    //Prototype for longpress delete
    
    func activateDeletionMode(_ gr: UILongPressGestureRecognizer) {
        if gr.state == .began {
            print("delete mode")
            
            func handleLongpressMethod(_ gestureRecognizer: UILongPressGestureRecognizer) {
                if gestureRecognizer.state != .ended {
                    return
                }
                let pt: CGPoint = gestureRecognizer.location(in: collectionView)
                let indexPath: IndexPath? = collectionView?.indexPathForItem(at: pt)
                if indexPath == nil {
                    print("couldn't find index path")
                }
                else {
                    // get the cell at indexPath (the one you long pressed)
                    let cell: UICollectionViewCell? = collectionView?.cellForItem(at: indexPath!)
                    books.remove(at: (indexPath?.row)!)
                    collectionView.reloadData()
                    // work  with the cell
                }
            }
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addBook(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        //self.present(imagePicker, animated: true, completion: nil)
        
        
        let actionSheet = UIAlertController(title: "Photo Shource", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            } }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)}))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: true, completion: {
                self.createBookItem(with: image)
            })
        }
        
        
    }
    

    

    
    func createBookItem (with image:UIImage) {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Add_Books_Library", in: self.managedObjextContext)
        
        
        let bookItem = Add_Books_Library(entity: entityDescription!,
                                        insertInto: self.managedObjextContext)
        
        bookItem.bookCover = NSData(data: UIImageJPEGRepresentation(image, 0.3)!)
        
        
        let inputAlert = UIAlertController(title: "New Book", message: "Enter the Book.", preferredStyle: .alert)
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Book"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Author"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Number of Pages"
        }
        
        inputAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) in
            
            let bookTextfield = inputAlert.textFields?[0]
            let authorTextfield = inputAlert.textFields?[1]
            let pagesTextfield = inputAlert.textFields?[2]
            
            bookItem.bookTitle = bookTextfield?.text!
            bookItem.author = authorTextfield?.text!
            bookItem.numberOfPages = pagesTextfield?.text!
            
            do {
                try self.managedObjextContext.save()
                print("Saved Name")
                
            } catch {
                print("Error")
            }
            
        }))
        /*
         //func that allows passing data with the segue
         func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         let destination = segue.destination as! BookDecisionFinal
         //sets the variable passedData (an empty string from avaterselction swift file) as the text inputted
         destination.passedData = (bookTextfield?.text)!
         destination.passedAuthor = (authorTextfield?.text)!
         destination.passedPages = (pagesTextfield?.text)!
         }
         */
        
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(inputAlert, animated: true, completion: nil)
        
        
    }
}

        
    











