//
//  InlineSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/21/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class InlineSortFunctionTests: SortFunctionTests {
    
    func testInlineSortFunctions(withStartCorner corner: SpruceCorner, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        let sortFunction = InlineSortFunction(corner: corner, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
        
        printTimedViews(timedViews)
        printTimedViews(timedViewsReversed)
    }
    
    func testTopLeftInlineSortFunction() {
        let expected = [0.0,0.1,0.2,0.3,0.4,
                        0.5,0.6,0.7,0.8,0.9,
                        1.0,1.1,1.2,1.3,1.4,
                        1.5,1.6,1.7,1.8,1.9,
                        2.0,2.1,2.2,2.3,2.4]
        let expectedReversed = [2.4,2.3,2.2,2.1,2.0,
                                1.9,1.8,1.7,1.6,1.5,
                                1.4,1.3,1.2,1.1,1.0,
                                0.9,0.8,0.7,0.6,0.5,
                                0.4,0.3,0.2,0.1,0.0]
        testInlineSortFunctions(withStartCorner: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightInlineSortFunction() {
        let expected = [0.4,0.3,0.2,0.1,0.0,
                        0.9,0.8,0.7,0.6,0.5,
                        1.4,1.3,1.2,1.1,1.0,
                        1.9,1.8,1.7,1.6,1.5,
                        2.4,2.3,2.2,2.1,2.0]
        let expectedReversed = [2.0,2.1,2.2,2.3,2.4,
                                1.5,1.6,1.7,1.8,1.9,
                                1.0,1.1,1.2,1.3,1.4,
                                0.5,0.6,0.7,0.8,0.9,
                                0.0,0.1,0.2,0.3,0.4]
        testInlineSortFunctions(withStartCorner: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftInlineSortFunction() {
        let expected = [2.0,2.1,2.2,2.3,2.4,
                        1.5,1.6,1.7,1.8,1.9,
                        1.0,1.1,1.2,1.3,1.4,
                        0.5,0.6,0.7,0.8,0.9,
                        0.0,0.1,0.2,0.3,0.4]
        let expectedReversed = [0.4,0.3,0.2,0.1,0.0,
                                0.9,0.8,0.7,0.6,0.5,
                                1.4,1.3,1.2,1.1,1.0,
                                1.9,1.8,1.7,1.6,1.5,
                                2.4,2.3,2.2,2.1,2.0]
        testInlineSortFunctions(withStartCorner: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }

    func testBottomRightInlineSortFunction() {
        let expected = [2.4,2.3,2.2,2.1,2.0,
                        1.9,1.8,1.7,1.6,1.5,
                        1.4,1.3,1.2,1.1,1.0,
                        0.9,0.8,0.7,0.6,0.5,
                        0.4,0.3,0.2,0.1,0.0]
        let expectedReversed = [0.0,0.1,0.2,0.3,0.4,
                                0.5,0.6,0.7,0.8,0.9,
                                1.0,1.1,1.2,1.3,1.4,
                                1.5,1.6,1.7,1.8,1.9,
                                2.0,2.1,2.2,2.3,2.4]
        testInlineSortFunctions(withStartCorner: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
