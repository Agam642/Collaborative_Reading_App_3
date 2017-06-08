//
//  CameraUpload.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din on 2017-04-26.
//  Copyright © 2017 Saif Al-Din. All rights reserved.
//

import UIKit
import CoreData

class CameraUpload: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var images = [Add_Books_Library]()
    
    var managedObjextContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let bookItem = Add_Books_Library(context: managedObjextContext)
        
        if let bookImage = UIImage(data: bookItem.bookCover! as Data) {
            self.myImageView.image = bookImage
        }

        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImageView.image = image
            //myImageView.image = images.
        } else {
            //Diplay error message
        }
        
        self.dismiss(animated: true, completion: nil)
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
}
    
    @IBAction func ChooseImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
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
        
        
}
