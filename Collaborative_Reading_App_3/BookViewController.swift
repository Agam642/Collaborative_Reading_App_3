//
//  BookViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din on 2017-05-26.
//  Copyright © 2017 Saif Al-Din. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var books = [Add_Books_Library]()
    
    var images : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    /*public func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BookViewCell
    
    let bookItem = books[indexPath.row]
    
    if let bookImage = UIImage(data: bookItem.image! as Data) {
    cell.backgroundImageView.image = bookImage
    }
    
    cell.nameLabel.text = bookItem.author
    cell.itemLabel.text = bookItem.bookName
    
    
    return cell
    } */

    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //BookViewCell
        
        let myCell: BookViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myBook", for: indexPath) as! BookViewCell
        
        return myCell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on image #\(indexPath.row)")
    }

    
}
