//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Matthew Weintrub on 10/31/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: foodTracker tests
    
    //tests to confirm that meal initializer returns when no name or a negative rating is provided
    func testMealInitialization() {
        
        //success case
        let potentialItem = meal(name: "newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        // XCTAssertNotNil tests that the Meal object is not nil after initialization, which means the initializer successfully created a Meal object with the supplied arguments.
        
        //fail case
        let noName = meal(name: "", photo:nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = meal(name: "really bad rating", photo:nil, rating: -1)
        XCTAssertNil(badRating, "negative ratings are invalid, be positive")

    }
    
}

