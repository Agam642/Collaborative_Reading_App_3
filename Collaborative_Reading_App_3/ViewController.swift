//
//  ViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
       collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //Displays the cells of the Home feed
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
}

