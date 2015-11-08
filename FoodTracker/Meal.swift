//
//  Meal.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 11/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class Meal {
    //MARK: properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: initializer
    
    init?(name: String, photo: UIImage?, rating:Int) {
        
        //initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //initialize should fail if there is no name or the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}