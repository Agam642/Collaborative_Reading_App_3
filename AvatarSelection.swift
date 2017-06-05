//
//  AvatarSelection.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-05-16.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class AvatarSelection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //outlet for collection view
    @IBOutlet weak var collectionView: UICollectionView!
    
    //outlet for label with name
    @IBOutlet weak var namelbl: UILabel!
    
    //array to store the images
    var images = ["Bear", "Cow", "Elephant", "Flamingo", "Fox", "Hippo", "Jellyfish", "SHEEP", "Parrot", "Penguin", "Wolf", "Panda"]
    
    //sets the variable passedData as an empty string
    var passedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        //displays message
        namelbl.text = "Hi " + passedData + ","
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //number of cells and images
        return images.count
    }
    
    //function used to place image in each cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //sets customcell as a reusable cell for each image
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        //places image in each cell
        cell.myImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      

        //next 4 lines allow one cell to be highlighted when selected
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = .none
        cell!.layer.borderWidth = 2.0
        cell!.layer.borderColor = UIColor.white.cgColor

    }


}
