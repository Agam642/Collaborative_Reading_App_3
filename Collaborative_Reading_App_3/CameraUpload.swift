//
//  CameraUpload.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din on 2017-04-26.
//  Copyright © 2017 Saif Al-Din. All rights reserved.
//

import UIKit

class CameraUpload: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImageView.image = image
        } else {
            //Diplay error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ImageUpload(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.sourceType = UIImagePickerControllerSourceType.camera
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After completed
        }
    }
}
