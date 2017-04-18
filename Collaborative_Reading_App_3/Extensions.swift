//
//  Extensions.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-04-18.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

extension UIColor {//Entension used to speed up workflow
    //You don't have to use /255 everytime you want to add an rgb colour
    static func rgb (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)-> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

