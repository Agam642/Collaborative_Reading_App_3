//
//  BookData.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-06-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class BookData: NSManagedObject {
    
    @NSManaged var author: String
    @NSManaged var bookTitle: String
    @NSManaged var bookCover: Data
    @NSManaged var numberOfPages: String
    
}
