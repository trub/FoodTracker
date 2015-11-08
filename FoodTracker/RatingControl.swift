//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 10/31/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: properties
    
    var rating = 0 {
        didSet {
            //trigger a layout update every time the rating changes
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5
    
    //MARK: initialization
    override func layoutSubviews() {
        // set the button's width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        //create 5 buttons
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted,.Selected])
            
            
            button.adjustsImageWhenHighlighted = false
            
            
            //attaches action ratingButtonTapped: to the button object, which will be triggered whenever the .TouchDown event occurs
            button.addTarget(self, action: "ratingButtonPressed:", forControlEvents: .TouchDown)
            ratingButtons +=  [button]
            addSubview(button)
            
        }
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return  CGSize(width: width, height: buttonSize)
    }
  
    //MARK: button action
    func ratingButtonPressed(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        print("assign rating")
        
        updateButtonSelectionStates()
        
    }
    
    func updateButtonSelectionStates() {
        
        for(index,button) in ratingButtons.enumerate() {
            
            //if the index of a button is less than the rating, that button should be selected
            button.selected = index < rating
        }
    }

}



