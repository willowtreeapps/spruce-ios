//
//  CorneredSortFunctionTests.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


import XCTest

class CorneredSortFunctionTests: SortFunctionTests {
    
    func testCorneredSortFunction(withCorner corner: SpruceCorner, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = CorneredSortFunction(corner: corner, interObjectDelay: 0.1)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.timeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testTopLeftCorneredSortFunction() {
        let expected = [0.0,0.1,0.2,0.3,0.4,
                        0.1,0.2,0.3,0.4,0.5,
                        0.2,0.3,0.4,0.5,0.6,
                        0.3,0.4,0.5,0.6,0.7,
                        0.4,0.5,0.6,0.7,0.8]
        let expectedReversed = [0.8,0.7,0.6,0.5,0.4,
                                0.7,0.6,0.5,0.4,0.3,
                                0.6,0.5,0.4,0.3,0.2,
                                0.5,0.4,0.3,0.2,0.1,
                                0.4,0.3,0.2,0.1,0.0]
        
        testCorneredSortFunction(withCorner: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightCorneredSortFunction() {
        let expected = [0.4,0.3,0.2,0.1,0.0,
                        0.5,0.4,0.3,0.2,0.1,
                        0.6,0.5,0.4,0.3,0.2,
                        0.7,0.6,0.5,0.4,0.3,
                        0.8,0.7,0.6,0.5,0.4]
        let expectedReversed = [0.4,0.5,0.6,0.7,0.8,
                                0.3,0.4,0.5,0.6,0.7,
                                0.2,0.3,0.4,0.5,0.6,
                                0.1,0.2,0.3,0.4,0.5,
                                0.0,0.1,0.2,0.3,0.4]
        
        testCorneredSortFunction(withCorner: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftCorneredSortFunction() {
        let expected = [0.4,0.5,0.6,0.7,0.8,
                        0.3,0.4,0.5,0.6,0.7,
                        0.2,0.3,0.4,0.5,0.6,
                        0.1,0.2,0.3,0.4,0.5,
                        0.0,0.1,0.2,0.3,0.4]
        let expectedReversed = [0.4,0.3,0.2,0.1,0.0,
                                0.5,0.4,0.3,0.2,0.1,
                                0.6,0.5,0.4,0.3,0.2,
                                0.7,0.6,0.5,0.4,0.3,
                                0.8,0.7,0.6,0.5,0.4]
        
        testCorneredSortFunction(withCorner: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightCorneredSortFunction() {
        let expected = [0.8,0.7,0.6,0.5,0.4,
                        0.7,0.6,0.5,0.4,0.3,
                        0.6,0.5,0.4,0.3,0.2,
                        0.5,0.4,0.3,0.2,0.1,
                        0.4,0.3,0.2,0.1,0.0]
        let expectedReversed = [0.0,0.1,0.2,0.3,0.4,
                                0.1,0.2,0.3,0.4,0.5,
                                0.2,0.3,0.4,0.5,0.6,
                                0.3,0.4,0.5,0.6,0.7,
                                0.4,0.5,0.6,0.7,0.8]
        
        testCorneredSortFunction(withCorner: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
