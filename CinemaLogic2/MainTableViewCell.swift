//
//  MainTableViewCell.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 31.10.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
        @IBOutlet weak var imageCell: UIImageView!
        
        @IBOutlet weak var nameLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
        
}
