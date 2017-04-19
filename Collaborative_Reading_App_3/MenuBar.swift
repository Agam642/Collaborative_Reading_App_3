//
//  MenuBar.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-04-18.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class MenuBar : UIView {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.rgb(red: 69, green: 179, blue: 231, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
