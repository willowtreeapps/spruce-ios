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
@testable import Spruce

class InlineSortFunctionTests: SortFunctionTests {
    
    func testInlineSortFunctions(withStartCorner corner: Corner, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = InlineSortFunction(corner: corner)
        let weightedViews = sortFunction.weights(for: animatableView)
        
        compare(weightedViews: weightedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let weightedViewsReversed = sortFunction.weights(for: animatableView)
        compare(weightedViews: weightedViewsReversed, toExpected: expectedReversed)
    }
    
    func testInlineSortFunctionWithEmptyView() {
        let sortFunction = InlineSortFunction(corner: .topLeft)
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
    
    func testTopLeftInlineSortFunction() {
        let expected = [0.0,1.0,2.0,3.0,4.0,
                        5.0,6.0,7.0,8.0,9.0,
                        10.0,11.0,12.0,13.0,14.0,
                        15.0,16.0,17.0,18.0,19.0,
                        20.0,21.0,22.0,23.0,24.0]
        let expectedReversed = [24.0,23.0,22.0,21.0,20.0,
                                19.0,18.0,17.0,16.0,15.0,
                                14.0,13.0,12.0,11.0,10.0,
                                9.0,8.0,7.0,6.0,5.0,
                                4.0,3.0,2.0,1.0,0.0]
        testInlineSortFunctions(withStartCorner: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightInlineSortFunction() {
        let expected = [4.0,3.0,2.0,1.0,0.0,
                        9.0,8.0,7.0,6.0,5.0,
                        14.0,13.0,12.0,11.0,10.0,
                        19.0,18.0,17.0,16.0,15.0,
                        24.0,23.0,22.0,21.0,20.0]
        let expectedReversed = [20.0,21.0,22.0,23.0,24.0,
                                15.0,16.0,17.0,18.0,19.0,
                                10.0,11.0,12.0,13.0,14.0,
                                5.0,6.0,7.0,8.0,9.0,
                                0.0,1.0,2.0,3.0,4.0]
        testInlineSortFunctions(withStartCorner: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftInlineSortFunction() {
        let expected = [20.0,21.0,22.0,23.0,24.0,
                        15.0,16.0,17.0,18.0,19.0,
                        10.0,11.0,12.0,13.0,14.0,
                        5.0,6.0,7.0,8.0,9.0,
                        0.0,1.0,2.0,3.0,4.0]
        let expectedReversed = [4.0,3.0,2.0,1.0,0.0,
                                9.0,8.0,7.0,6.0,5.0,
                                14.0,13.0,12.0,11.0,10.0,
                                19.0,18.0,17.0,16.0,15.0,
                                24.0,23.0,22.0,21.0,20.0]
        testInlineSortFunctions(withStartCorner: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }

    func testBottomRightInlineSortFunction() {
        let expected = [24.0,23.0,22.0,21.0,20.0,
                        19.0,18.0,17.0,16.0,15.0,
                        14.0,13.0,12.0,11.0,10.0,
                        9.0,8.0,7.0,6.0,5.0,
                        4.0,3.0,2.0,1.0,0.0]
        let expectedReversed = [0.0,1.0,2.0,3.0,4.0,
                                5.0,6.0,7.0,8.0,9.0,
                                10.0,11.0,12.0,13.0,14.0,
                                15.0,16.0,17.0,18.0,19.0,
                                20.0,21.0,22.0,23.0,24.0]
        testInlineSortFunctions(withStartCorner: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
