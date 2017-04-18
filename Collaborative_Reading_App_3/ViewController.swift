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
        imageView.image = UIImage(named: "RedEyesBDragon-LDK2-EN-C-1E")//Temporary name
        imageView.contentMode = .scaleAspectFill//Enlarges image to proper bounds
        imageView.clipsToBounds = true//Clips the image to the proper bounds
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Red-Eyes Black Dragon"//Temporary name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView : UITextView = {
        let textview = UITextView()
        textview.text = "2400 Attack, 2000 Defense"//Temporary name
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RedEyesDarknessDragon-LCJW-EN-C-1E")//Temporary name
        imageView.layer.cornerRadius = 22//Makes the profile image circular
        imageView.layer.masksToBounds = true
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
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        //Determines the scale of the images in feed
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":thumbNailImageView]))
        
        //Profile image constraint
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":userProfileImageView]))
        
       self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":thumbNailImageView, "v1":userProfileImageView, "v2":seperatorView]))
        
        //Constraints for line seperator
       self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v0":seperatorView]))
        
        //Top constraints (used for title)
        self.addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbNailImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0)])
        //Left constraint
        self.addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1.0, constant: 8.0)])
        //Right constraint
        self.addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbNailImageView, attribute: .right, multiplier: 1.0, constant: 0.0)])
        //Height constriant
        self.addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 20.0)])
        
        //Top constraints (used for subtitle)
        self.addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 8.0)])
        //Left constraint
        self.addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1.0, constant: 8.0)])
        //Right constraint
        self.addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbNailImageView, attribute: .right, multiplier: 1.0, constant: 0.0)])
        //Height constriant 
        self.addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 20.0)])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
