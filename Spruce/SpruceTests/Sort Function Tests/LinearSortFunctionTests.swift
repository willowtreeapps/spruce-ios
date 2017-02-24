//
//  LinearSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/21/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class LinearSortFunctionTests: SortFunctionTests {
    
    func testLinearSortFunctions(withDirection direction: SpruceDirection, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        let sortFunction = LinearSortFunction(direction: direction, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
        
        printTimedViews(timedViews)
        printTimedViews(timedViewsReversed)
    }
    
    func testTopToBottomLinearSortFunction() {
        let expected = [0.0,0.0,0.0,0.0,0.0,
                        0.1,0.1,0.1,0.1,0.1,
                        0.2,0.2,0.2,0.2,0.2,
                        0.3,0.3,0.3,0.3,0.3,
                        0.4,0.4,0.4,0.4,0.4]
        let expectedReversed = [0.4,0.4,0.4,0.4,0.4,
                                0.3,0.3,0.3,0.3,0.3,
                                0.2,0.2,0.2,0.2,0.2,
                                0.1,0.1,0.1,0.1,0.1,
                                0.0,0.0,0.0,0.0,0.0]
        testLinearSortFunctions(withDirection: .topToBottom, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomToTopLinearSortFunction() {
        let expected = [0.4,0.4,0.4,0.4,0.4,
                        0.3,0.3,0.3,0.3,0.3,
                        0.2,0.2,0.2,0.2,0.2,
                        0.1,0.1,0.1,0.1,0.1,
                        0.0,0.0,0.0,0.0,0.0]
        let expectedReversed = [0.0,0.0,0.0,0.0,0.0,
                                0.1,0.1,0.1,0.1,0.1,
                                0.2,0.2,0.2,0.2,0.2,
                                0.3,0.3,0.3,0.3,0.3,
                                0.4,0.4,0.4,0.4,0.4]
        testLinearSortFunctions(withDirection: .bottomToTop, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftToRightLinearSortFunction() {
        let expected = [0.0,0.1,0.2,0.3,0.4,
                        0.0,0.1,0.2,0.3,0.4,
                        0.0,0.1,0.2,0.3,0.4,
                        0.0,0.1,0.2,0.3,0.4,
                        0.0,0.1,0.2,0.3,0.4]
        let expectedReversed = [0.4,0.3,0.2,0.1,0.0,
                                0.4,0.3,0.2,0.1,0.0,
                                0.4,0.3,0.2,0.1,0.0,
                                0.4,0.3,0.2,0.1,0.0,
                                0.4,0.3,0.2,0.1,0.0]
        testLinearSortFunctions(withDirection: .leftToRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightToLeftLinearSortFunction() {
        let expected = [0.4,0.3,0.2,0.1,0.0,
                        0.4,0.3,0.2,0.1,0.0,
                        0.4,0.3,0.2,0.1,0.0,
                        0.4,0.3,0.2,0.1,0.0,
                        0.4,0.3,0.2,0.1,0.0]
        let expectedReversed = [0.0,0.1,0.2,0.3,0.4,
                                0.0,0.1,0.2,0.3,0.4,
                                0.0,0.1,0.2,0.3,0.4,
                                0.0,0.1,0.2,0.3,0.4,
                                0.0,0.1,0.2,0.3,0.4]
        testLinearSortFunctions(withDirection: .rightToLeft, expected: expected, expectedReversed: expectedReversed)
    }
}
