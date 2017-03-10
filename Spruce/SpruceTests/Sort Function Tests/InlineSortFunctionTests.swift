//
//  InlineSortFunctionTests.swift
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

class InlineSortFunctionTests: SortFunctionTests {
    
    func testInlineSortFunctions(withStartCorner corner: Corner, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = InlineSortFunction(corner: corner, interObjectDelay: 0.1)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.timeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
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
