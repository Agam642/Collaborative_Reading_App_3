//
//  AddBooksVC.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class AddBooksVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var books = [Add_Books]()
    
    var managedObjextContext:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let iconImageView = UIImageView(image: UIImage(named: "Shape"))
        self.navigationItem.titleView = iconImageView
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        loadData()
        
    }
    
    func loadData(){
        let bookRequest:NSFetchRequest<Add_Books> = Add_Books.fetchRequest()
        
        do {
            books = try managedObjextContext.fetch(bookRequest)
            self.tableView.reloadData()
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BookTableViewCell
        
        let bookItem = books[indexPath.row]
        
        if let bookImage = UIImage(data: bookItem.image! as Data) {
            cell.backgroundImageView.image = bookImage
        }
        
        cell.titleLabel.text = bookItem.bookName
        cell.authorLabel.text = bookItem.author
        cell.pageNumberLabel.text = bookItem.numberOfPages
        
        
        return cell
    }
    
    
    @IBAction func addBook(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
        

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
        
        let bookItem = Add_Books(context: managedObjextContext)
        bookItem.image = NSData(data: UIImageJPEGRepresentation(image, 0.3)!)
        
        
        let inputAlert = UIAlertController(title: "New Book", message: "Enter a new book.", preferredStyle: .alert)
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Book Name"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Author"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Number Of Pages"
        }
        
        inputAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) in
            
            let BookNameTextField = inputAlert.textFields?[0]
            let AuthorTextField = inputAlert.textFields?[1]
            let PagesTextField = inputAlert.textFields?[2]
            
            if BookNameTextField?.text != "" && AuthorTextField?.text != "" {
                bookItem.bookName = BookNameTextField?.text
                bookItem.author = AuthorTextField?.text
                bookItem.numberOfPages = PagesTextField?.text
                
                do {
                    try self.managedObjextContext.save()
                    self.loadData()
                }catch {
                    print("Could not save data \(error.localizedDescription)")
                }
                
            }
            
            
        }))
        
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(inputAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    
}
