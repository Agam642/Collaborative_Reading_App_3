//
//  Book.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-04-25.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class Book: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: Date?
    
    var user: User?
    
}

class User: NSObject {
    var name: String?
    var profileImageName: String?
}

