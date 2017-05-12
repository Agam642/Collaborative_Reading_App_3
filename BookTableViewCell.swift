//
//  BookTableViewCell.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-11.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class BookTableViewCell : UITableViewCell {
    
        @IBOutlet weak var titleLabel: UILabel!
    
        @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
