//
//  RadialSortFunctionTests.swift
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


import Foundation

class RadialSortFunctionTests: SortFunctionTests {
    
    func testRadialSortFunction(withPosition position: SprucePosition, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = RadialSortFunction(position: position, interObjectDelay: 0.1)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.timeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testTopLeftRadialSortFunction() {
        let expected = [0.0,0.1,0.3,0.6,0.9,
                        0.1,0.2,0.4,0.7,1.0,
                        0.3,0.4,0.5,0.8,1.2,
                        0.6,0.7,0.8,1.1,1.3,
                        0.9,1.0,1.2,1.3,1.4]
        let expectedReversed = [1.4,1.3,1.1,0.8,0.5,
                                1.3,1.2,1.0,0.7,0.4,
                                1.1,1.0,0.9,0.6,0.2,
                                0.8,0.7,0.6,0.3,0.1,
                                0.5,0.4,0.2,0.1,0.0]
        testRadialSortFunction(withPosition: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleRadialSortFunction() {
        let expected = [0.3,0.1,0.0,0.1,0.3,
                        0.4,0.2,0.1,0.2,0.4,
                        0.5,0.4,0.3,0.4,0.5,
                        0.8,0.7,0.6,0.7,0.8,
                        1.1,1.0,0.9,1.0,1.1]
        let expectedReversed = [0.8,1.0,1.1,1.0,0.8,
                                0.7,0.9,1.0,0.9,0.7,
                                0.6,0.7,0.8,0.7,0.6,
                                0.3,0.4,0.5,0.4,0.3,
                                0.0,0.1,0.2,0.1,0.0]
        testRadialSortFunction(withPosition: .topMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightRadialSortFunction() {
        let expected = [0.9,0.6,0.3,0.1,0.0,
                        1.0,0.7,0.4,0.2,0.1,
                        1.2,0.8,0.5,0.4,0.3,
                        1.3,1.1,0.8,0.7,0.6,
                        1.4,1.3,1.2,1.0,0.9]
        let expectedReversed = [0.5,0.8,1.1,1.3,1.4,
                                0.4,0.7,1.0,1.2,1.3,
                                0.2,0.6,0.9,1.0,1.1,
                                0.1,0.3,0.6,0.7,0.8,
                                0.0,0.1,0.2,0.4,0.5]
        testRadialSortFunction(withPosition: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftRadialSortFunction() {
        let expected = [0.3,0.4,0.5,0.8,1.1,
                        0.1,0.2,0.4,0.7,1.0,
                        0.0,0.1,0.3,0.6,0.9,
                        0.1,0.2,0.4,0.7,1.0,
                        0.3,0.4,0.5,0.8,1.1]
        let expectedReversed = [0.8,0.7,0.6,0.3,0.0,
                                1.0,0.9,0.7,0.4,0.1,
                                1.1,1.0,0.8,0.5,0.2,
                                1.0,0.9,0.7,0.4,0.1,
                                0.8,0.7,0.6,0.3,0.0]
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
        let expected = [1.1,0.8,0.5,0.4,0.3,
                        1.0,0.7,0.4,0.2,0.1,
                        0.9,0.6,0.3,0.1,0.0,
                        1.0,0.7,0.4,0.2,0.1,
                        1.1,0.8,0.5,0.4,0.3]
        let expectedReversed = [0.0,0.3,0.6,0.7,0.8,
                                0.1,0.4,0.7,0.9,1.0,
                                0.2,0.5,0.8,1.0,1.1,
                                0.1,0.4,0.7,0.9,1.0,
                                0.0,0.3,0.6,0.7,0.8]
        testRadialSortFunction(withPosition: .right, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftRadialSortFunction() {
        let expected = [0.9,1.0,1.2,1.3,1.4,
                        0.6,0.7,0.8,1.1,1.3,
                        0.3,0.4,0.5,0.8,1.2,
                        0.1,0.2,0.4,0.7,1.0,
                        0.0,0.1,0.3,0.6,0.9]
        let expectedReversed = [0.5,0.4,0.2,0.1,0.0,
                                0.8,0.7,0.6,0.3,0.1,
                                1.1,1.0,0.9,0.6,0.2,
                                1.3,1.2,1.0,0.7,0.4,
                                1.4,1.3,1.1,0.8,0.5]
        testRadialSortFunction(withPosition: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleRadialSortFunction() {
        let expected = [1.1,1.0,0.9,1.0,1.1,
                        0.8,0.7,0.6,0.7,0.8,
                        0.5,0.4,0.3,0.4,0.5,
                        0.4,0.2,0.1,0.2,0.4,
                        0.3,0.1,0.0,0.1,0.3]
        let expectedReversed = [0.0,0.1,0.2,0.1,0.0,
                                0.3,0.4,0.5,0.4,0.3,
                                0.6,0.7,0.8,0.7,0.6,
                                0.7,0.9,1.0,0.9,0.7,
                                0.8,1.0,1.1,1.0,0.8]
        testRadialSortFunction(withPosition: .bottomMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightRadialSortFunction() {
        let expected = [1.4,1.3,1.2,1.0,0.9,
                        1.3,1.1,0.8,0.7,0.6,
                        1.2,0.8,0.5,0.4,0.3,
                        1.0,0.7,0.4,0.2,0.1,
                        0.9,0.6,0.3,0.1,0.0]
        let expectedReversed = [0.0,0.1,0.2,0.4,0.5,
                                0.1,0.3,0.6,0.7,0.8,
                                0.2,0.6,0.9,1.0,1.1,
                                0.4,0.7,1.0,1.2,1.3,
                                0.5,0.8,1.1,1.3,1.4]
        testRadialSortFunction(withPosition: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
