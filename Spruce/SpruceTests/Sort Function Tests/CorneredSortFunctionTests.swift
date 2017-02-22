//
//  CorneredSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/7/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class CorneredSortFunctionTests: SortFunctionTests {
    
    func testCorneredSortFunction(withCorner corner: SpruceCorner, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        let sortFunction = CorneredSortFunction(corner: corner, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
        
        printTimedViews(timedViewsReversed)
    }
    
    func testTopLeftCorneredSortFunction() {
        let expected = [0.0,0.1,0.3,0.5,0.8,
                        0.1,0.2,0.4,0.6,0.9,
                        0.3,0.4,0.5,0.7,1.1,
                        0.5,0.6,0.7,1.0,1.2,
                        0.8,0.9,1.1,1.2,1.3]
        let expectedReversed = [1.3,1.2,1.0,0.8,0.5,
                                1.2,1.1,0.9,0.7,0.4,
                                1.0,0.9,0.8,0.6,0.2,
                                0.8,0.7,0.6,0.3,0.1,
                                0.5,0.4,0.2,0.1,0.0]
        
        testCorneredSortFunction(withCorner: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightCorneredSortFunction() {
        let expected = [0.8,0.5,0.3,0.1,0.0,
                        0.9,0.6,0.4,0.2,0.1,
                        1.1,0.7,0.5,0.4,0.3,
                        1.2,1.0,0.7,0.6,0.5,
                        1.3,1.2,1.1,0.9,0.8]
        let expectedReversed = [0.5,0.8,1.0,1.2,1.3,
                                0.4,0.7,0.9,1.1,1.2,
                                0.2,0.6,0.8,0.9,1.0,
                                0.1,0.3,0.6,0.7,0.8,
                                0.0,0.1,0.2,0.4,0.5]
        
        testCorneredSortFunction(withCorner: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftCorneredSortFunction() {
        let expected = [0.8,0.9,1.1,1.2,1.3,
                        0.5,0.6,0.7,1.0,1.2,
                        0.3,0.4,0.5,0.7,1.1,
                        0.1,0.2,0.4,0.6,0.9,
                        0.0,0.1,0.3,0.5,0.8]
        let expectedReversed = [0.5,0.4,0.2,0.1,0.0,
                                0.8,0.7,0.6,0.3,0.1,
                                1.0,0.9,0.8,0.6,0.2,
                                1.2,1.1,0.9,0.7,0.4,
                                1.3,1.2,1.0,0.8,0.5]
        
        testCorneredSortFunction(withCorner: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightCorneredSortFunction() {
        let expected = [1.3,1.2,1.1,0.9,0.8,
                        1.2,1.0,0.7,0.6,0.5,
                        1.1,0.7,0.5,0.4,0.3,
                        0.9,0.6,0.4,0.2,0.1,
                        0.8,0.5,0.3,0.1,0.0]
        let expectedReversed = [0.0,0.1,0.2,0.4,0.5,
                                0.1,0.3,0.6,0.7,0.8,
                                0.2,0.6,0.8,0.9,1.0,
                                0.4,0.7,0.9,1.1,1.2,
                                0.5,0.8,1.0,1.2,1.3]
        
        testCorneredSortFunction(withCorner: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
