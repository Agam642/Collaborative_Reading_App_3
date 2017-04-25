//
//  FeedCell.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-25.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

/*
class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self//Used to run the feed and compile the other classes
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    var books : [Book]?
    
    override func setupViews() {
      super.setupViews()
        
        backgroundColor = UIColor.brown
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.register(BookCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return books?.count ?? 0
            }
    
             func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! BookCell
          
                    cell.video = books?[indexPath.item]
                
                return cell
            }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
               let height = (frame.width - 16 - 16) * 9 / 16
                return CGSizeMake(frame.width, height + 16 + 88)
            }
    
            func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
                return 0
            }
        
/*

}
































