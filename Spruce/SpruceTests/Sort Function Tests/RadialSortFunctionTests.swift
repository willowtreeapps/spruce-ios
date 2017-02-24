//
//  RadialSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/8/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

class RadialSortFunctionTests: SortFunctionTests {
    
    func testRadialSortFunction(withPosition position: SprucePosition, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        let sortFunction = RadialSortFunction(position: position, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
        
        printTimedViews(timedViewsReversed)
    }
    
    func testTopLeftRadialSortFunction() {
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
        testRadialSortFunction(withPosition: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleRadialSortFunction() {
        let expected = [0.4,0.1,0.0,0.1,0.4,
                        0.5,0.3,0.2,0.3,0.5,
                        0.7,0.6,0.5,0.6,0.7,
                        1.0,0.9,0.8,0.9,1.0,
                        1.3,1.2,1.1,1.2,1.3]
        let expectedReversed = [0.9,1.2,1.3,1.2,0.9,
                                0.8,1.0,1.1,1.0,0.8,
                                0.6,0.7,0.8,0.7,0.6,
                                0.3,0.4,0.5,0.4,0.3,
                                0.0,0.1,0.2,0.1,0.0]
        testRadialSortFunction(withPosition: .topMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightRadialSortFunction() {
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
        testRadialSortFunction(withPosition: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftRadialSortFunction() {
        let expected = [0.4,0.5,0.7,1.0,1.3,
                        0.1,0.3,0.6,0.9,1.2,
                        0.0,0.2,0.5,0.8,1.1,
                        0.1,0.3,0.6,0.9,1.2,
                        0.4,0.5,0.7,1.0,1.3]
        let expectedReversed = [0.9,0.8,0.6,0.3,0.0,
                                1.2,1.0,0.7,0.4,0.1,
                                1.3,1.1,0.8,0.5,0.2,
                                1.2,1.0,0.7,0.4,0.1,
                                0.9,0.8,0.6,0.3,0.0]
        testRadialSortFunction(withPosition: .left, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleRadialSortFunction() {
        let expected = [0.5,0.4,0.3,0.4,0.5,
                        0.4,0.2,0.1,0.2,0.4,
                        0.3,0.1,0.0,0.1,0.3,
                        0.4,0.2,0.1,0.2,0.4,
                        0.5,0.4,0.3,0.4,0.5]
        let expectedReversed = [0.0,0.1,0.2,0.1,0.0,
                                0.1,0.3,0.4,0.3,0.1,
                                0.2,0.4,0.5,0.4,0.2,
                                0.1,0.3,0.4,0.3,0.1,
                                0.0,0.1,0.2,0.1,0.0]
        testRadialSortFunction(withPosition: .middle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightRadialSortFunction() {
        let expected = [1.3,1.0,0.7,0.5,0.4,
                        1.2,0.9,0.6,0.3,0.1,
                        1.1,0.8,0.5,0.2,0.0,
                        1.2,0.9,0.6,0.3,0.1,
                        1.3,1.0,0.7,0.5,0.4]
        let expectedReversed = [0.0,0.3,0.6,0.8,0.9,
                                0.1,0.4,0.7,1.0,1.2,
                                0.2,0.5,0.8,1.1,1.3,
                                0.1,0.4,0.7,1.0,1.2,
                                0.0,0.3,0.6,0.8,0.9]
        testRadialSortFunction(withPosition: .right, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftRadialSortFunction() {
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
        testRadialSortFunction(withPosition: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleRadialSortFunction() {
        let expected = [1.3,1.2,1.1,1.2,1.3,
                        1.0,0.9,0.8,0.9,1.0,
                        0.7,0.6,0.5,0.6,0.7,
                        0.5,0.3,0.2,0.3,0.5,
                        0.4,0.1,0.0,0.1,0.4]
        let expectedReversed = [0.0,0.1,0.2,0.1,0.0,
                                0.3,0.4,0.5,0.4,0.3,
                                0.6,0.7,0.8,0.7,0.6,
                                0.8,1.0,1.1,1.0,0.8,
                                0.9,1.2,1.3,1.2,0.9]
        testRadialSortFunction(withPosition: .bottomMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightRadialSortFunction() {
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
        testRadialSortFunction(withPosition: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
