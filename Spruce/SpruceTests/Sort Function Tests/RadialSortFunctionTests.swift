//
//  RadialSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/8/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

class RadialSortFunctionTests: SortFunctionTests {
    
    func testTopLeftRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .topLeft, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.3,0.5,0.8,
                        0.1,0.2,0.4,0.6,0.9,
                        0.3,0.4,0.5,0.7,1.1,
                        0.5,0.6,0.7,1.0,1.2,
                        0.8,0.9,1.1,1.2,1.3]
        compare(timedViews: timedViews, toExpected: expected)
        
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [1.3,1.2,1.0,0.8,0.5,
                                1.2,1.1,0.9,0.7,0.4,
                                1.0,0.9,0.8,0.6,0.2,
                                0.8,0.7,0.6,0.3,0.1,
                                0.5,0.4,0.2,0.1,0.0]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testTopMiddleRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .topMiddle, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.4,0.1,0.0,0.1,0.4,
                        0.5,0.3,0.2,0.3,0.5,
                        0.7,0.6,0.5,0.6,0.7,
                        1.0,0.9,0.8,0.9,1.0,
                        1.3,1.2,1.1,1.2,1.3]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.9,1.2,1.3,1.2,0.9,
                                0.8,1.0,1.1,1.0,0.8,
                                0.6,0.7,0.8,0.7,0.6,
                                0.3,0.4,0.5,0.4,0.3,
                                0.0,0.1,0.2,0.1,0.0]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testTopRightRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .topRight, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.8,0.5,0.3,0.1,0.0,
                        0.9,0.6,0.4,0.2,0.1,
                        1.1,0.7,0.5,0.4,0.3,
                        1.2,1.0,0.7,0.6,0.5,
                        1.3,1.2,1.1,0.9,0.8]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.5,0.8,1.0,1.2,1.3,
                                0.4,0.7,0.9,1.1,1.2,
                                0.2,0.6,0.8,0.9,1.0,
                                0.1,0.3,0.6,0.7,0.8,
                                0.0,0.1,0.2,0.4,0.5]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testLeftRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .left, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.4,0.5,0.7,1.0,1.3,
                        0.1,0.3,0.6,0.9,1.2,
                        0.0,0.2,0.5,0.8,1.1,
                        0.1,0.3,0.6,0.9,1.2,
                        0.4,0.5,0.7,1.0,1.3]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.9,0.8,0.6,0.3,0.0,
                                1.2,1.0,0.7,0.4,0.1,
                                1.3,1.1,0.8,0.5,0.2,
                                1.2,1.0,0.7,0.4,0.1,
                                0.9,0.8,0.6,0.3,0.0]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testMiddleRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .middle, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.5,0.4,0.3,0.4,0.5,
                        0.4,0.2,0.1,0.2,0.4,
                        0.3,0.1,0.0,0.1,0.3,
                        0.4,0.2,0.1,0.2,0.4,
                        0.5,0.4,0.3,0.4,0.5]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.0,0.1,0.2,0.1,0.0,
                                0.1,0.3,0.4,0.3,0.1,
                                0.2,0.4,0.5,0.4,0.2,
                                0.1,0.3,0.4,0.3,0.1,
                                0.0,0.1,0.2,0.1,0.0]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testRightRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .right, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [1.3,1.0,0.7,0.5,0.4,
                        1.2,0.9,0.6,0.3,0.1,
                        1.1,0.8,0.5,0.2,0.0,
                        1.2,0.9,0.6,0.3,0.1,
                        1.3,1.0,0.7,0.5,0.4]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.0,0.3,0.6,0.8,0.9,
                                0.1,0.4,0.7,1.0,1.2,
                                0.2,0.5,0.8,1.1,1.3,
                                0.1,0.4,0.7,1.0,1.2,
                                0.0,0.3,0.6,0.8,0.9]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testBottomLeftRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .bottomLeft, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.8,0.9,1.1,1.2,1.3,
                        0.5,0.6,0.7,1.0,1.2,
                        0.3,0.4,0.5,0.7,1.1,
                        0.1,0.2,0.4,0.6,0.9,
                        0.0,0.1,0.3,0.5,0.8]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.5,0.4,0.2,0.1,0.0,
                                0.8,0.7,0.6,0.3,0.1,
                                1.0,0.9,0.8,0.6,0.2,
                                1.2,1.1,0.9,0.7,0.4,
                                1.3,1.2,1.0,0.8,0.5]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testBottomMiddleRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .bottomMiddle, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [1.3,1.2,1.1,1.2,1.3,
                        1.0,0.9,0.8,0.9,1.0,
                        0.7,0.6,0.5,0.6,0.7,
                        0.5,0.3,0.2,0.3,0.5,
                        0.4,0.1,0.0,0.1,0.4]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.0,0.1,0.2,0.1,0.0,
                                0.3,0.4,0.5,0.4,0.3,
                                0.6,0.7,0.8,0.7,0.6,
                                0.8,1.0,1.1,1.0,0.8,
                                0.9,1.2,1.3,1.2,0.9]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testBottomRightRadialSortFunction() {
        let sortFunction = RadialSortFunction(position: .bottomRight, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [1.3,1.2,1.1,0.9,0.8,
                        1.2,1.0,0.7,0.6,0.5,
                        1.1,0.7,0.5,0.4,0.3,
                        0.9,0.6,0.4,0.2,0.1,
                        0.8,0.5,0.3,0.1,0.0]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        let expectedReversed = [0.0,0.1,0.2,0.4,0.5,
                                0.1,0.3,0.6,0.7,0.8,
                                0.2,0.6,0.8,0.9,1.0,
                                0.4,0.7,0.9,1.1,1.2,
                                0.5,0.8,1.0,1.2,1.3]
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
}
