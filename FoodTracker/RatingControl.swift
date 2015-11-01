//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 10/31/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        addSubview(button)
    }
    
    override func intrinsicContentSize() -> CGSize {
        return  CGSize(width: 240, height: 44)
    }
  

}
