//
//  BaseDistanceSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/7/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class BaseDistanceSortFunctionTests: SortFunctionTests {
    
    func testBaseDistanceSortFunction() {
        let sortFunction = BaseDistancedSortFunction(interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.3,0.5,0.8,
                        0.1,0.2,0.4,0.6,0.9,
                        0.3,0.4,0.5,0.7,1.1,
                        0.5,0.6,0.7,1.0,1.2,
                        0.8,0.9,1.1,1.2,1.3]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let expectedReversed = [1.3,1.2,1.0,0.8,0.5,
                                1.2,1.1,0.9,0.7,0.4,
                                1.0,0.9,0.8,0.6,0.2,
                                0.8,0.7,0.6,0.3,0.1,
                                0.5,0.4,0.2,0.1,0.0]
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
}
