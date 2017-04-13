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
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    //Eliminates space between images
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//Home feed
class bookCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    let thumbNailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Adds sperating line between cells
    let seperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpViews() {
        
        addSubview(thumbNailImageView)
        addSubview(seperatorView)
        
        //Determines the scale of the images in feed
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":thumbNailImageView])
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":thumbNailImageView, "v1":seperatorView])

        self.addConstraints(widthConstraints)
        self.addConstraints(verticalConstraints)
        
        //Constraints for line seperator
        let wLine = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":seperatorView])
        //let vLine = NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":seperatorView])
        
        self.addConstraints(wLine)
        //self.addConstraints(vLine)

    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
