//
//  CorneredSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/7/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class CorneredSortFunctionTests: SortFunctionTests {
    
    func testTopLeftCorneredSortFunction() {
        let sortFunction = CorneredSortFunction(corner: .topLeft, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.3,0.5,0.8,
                        0.1,0.2,0.4,0.6,0.9,
                        0.3,0.4,0.5,0.7,1.1,
                        0.5,0.6,0.7,1.0,1.2,
                        0.8,0.9,1.1,1.2,1.3]
        compare(timedViews: timedViews, toExpected: expected)
    }
    
    func testTopRightCorneredSortFunction() {
        let sortFunction = CorneredSortFunction(corner: .topRight, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.8,0.5,0.3,0.1,0.0,
                        0.9,0.6,0.4,0.2,0.1,
                        1.1,0.7,0.5,0.4,0.3,
                        1.2,1.0,0.7,0.6,0.5,
                        1.3,1.2,1.1,0.9,0.8]
        compare(timedViews: timedViews, toExpected: expected)
    }
    
    func testBottomLeftCorneredSortFunction() {
        let sortFunction = CorneredSortFunction(corner: .bottomLeft, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.8,0.9,1.1,1.2,1.3,
                        0.5,0.6,0.7,1.0,1.2,
                        0.3,0.4,0.5,0.7,1.1,
                        0.1,0.2,0.4,0.6,0.9,
                        0.0,0.1,0.3,0.5,0.8]
        compare(timedViews: timedViews, toExpected: expected)
    }
    
    func testBottomRightCorneredSortFunction() {
        let sortFunction = CorneredSortFunction(corner: .bottomRight, interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [1.3,1.2,1.1,0.9,0.8,
                        1.2,1.0,0.7,0.6,0.5,
                        1.1,0.7,0.5,0.4,0.3,
                        0.9,0.6,0.4,0.2,0.1,
                        0.8,0.5,0.3,0.1,0.0]
        compare(timedViews: timedViews, toExpected: expected)
    }
}
