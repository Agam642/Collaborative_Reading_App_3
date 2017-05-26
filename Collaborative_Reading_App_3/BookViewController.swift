//
//  BookViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-05-26.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //BookViewCell
        
        let myCell: BookViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myBook", for: indexPath) as! BookViewCell
        
        return myCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on image #\(indexPath.row)")
    }

    
}
