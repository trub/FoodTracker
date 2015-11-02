//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 11/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
