//
//  ViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let viewControllerFile = UIViewController.self
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false//Fixes up the colour of Home a bit
        
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width - 32, height: view.frame.height))//Displaces the Home
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(bookCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //Displays the cells of the Home feed
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let Height = (view.frame.width - 16 - 16) * 9 / 16//Determines ratio for the size of the image
        
        return CGSize(width: view.frame.width, height: Height + 16 + 68)//Adds missing pixels to the image size
    }
    
    //Eliminates space between images
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

