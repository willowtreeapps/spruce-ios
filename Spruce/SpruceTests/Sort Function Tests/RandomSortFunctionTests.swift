//
//  RandomSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/14/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest
@testable import Spruce

class RandomSortFunctionTests: SortFunctionTests {
    
    func testRandomSortFunction() {
        let sortFunction = RandomSortFunction()
        let timedViews = sortFunction.weights(for: animatableView)
        
        XCTAssertEqual(timedViews.count, 25)
    }
    
    func testRandomSortFunctionWithEmptyView() {
        let sortFunction = RandomSortFunction()
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
}
