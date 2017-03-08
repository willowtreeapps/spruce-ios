//
//  LinearSortFunctionTests.swift
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

class LinearSortFunctionTests: SortFunctionTests {
    
    func testLinearSortFunctions(withDirection direction: SpruceDirection, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = LinearSortFunction(direction: direction, interObjectDelay: 0.1)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.timeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
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
