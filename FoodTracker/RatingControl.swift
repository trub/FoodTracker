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
        //attaches action ratingButtonTapped: to the button object, which will be triggered whenever the .TouchDown event occurs
        button.addTarget(self, action: "ratingButtonPressed:", forControlEvents: .TouchDown)
        addSubview(button)
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return  CGSize(width: 240, height: 44)
    }
  
    //MARK: button action
    func ratingButtonPressed(button: UIButton) {
        print("button pressed")
        
    }

}
