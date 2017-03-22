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
@testable import Spruce

class CorneredSortFunctionTests: SortFunctionTests {
    
    func testCorneredSortFunction(withCorner corner: Corner, expected: [Double], expectedReversed: [Double]) {
        var sortFunction = CorneredSortFunction(corner: corner)
        let weightedViews = sortFunction.weights(for: animatableView)
        
        compare(weightedViews: weightedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let weightedViewsReversed = sortFunction.weights(for: animatableView)
        compare(weightedViews: weightedViewsReversed, toExpected: expectedReversed)
        
        print("")
        print("let expected = ", terminator: "")
        printWeightedViews(weightedViews)
        print("let expectedReversed = ", terminator: "")
        printWeightedViews(weightedViewsReversed)
        print("")
    }
    
    func testCorneredSortFunctionWithEmptyView() {
        let sortFunction = CorneredSortFunction(corner: .topLeft)
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
    
    func testTopLeftCorneredSortFunction() {
        let expected = [0.0,100.0,200.0,300.0,400.0,
                        100.0,200.0,300.0,400.0,500.0,
                        200.0,300.0,400.0,500.0,600.0,
                        300.0,400.0,500.0,600.0,700.0,
                        400.0,500.0,600.0,700.0,800.0]
        let expectedReversed = [800.0,700.0,600.0,500.0,400.0,
                                700.0,600.0,500.0,400.0,300.0,
                                600.0,500.0,400.0,300.0,200.0,
                                500.0,400.0,300.0,200.0,100.0,
                                400.0,300.0,200.0,100.0,0.0]
        
        testCorneredSortFunction(withCorner: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightCorneredSortFunction() {
        let expected = [400.0,300.0,200.0,100.0,0.0,
                        500.0,400.0,300.0,200.0,100.0,
                        600.0,500.0,400.0,300.0,200.0,
                        700.0,600.0,500.0,400.0,300.0,
                        800.0,700.0,600.0,500.0,400.0]
        let expectedReversed = [400.0,500.0,600.0,700.0,800.0,
                                300.0,400.0,500.0,600.0,700.0,
                                200.0,300.0,400.0,500.0,600.0,
                                100.0,200.0,300.0,400.0,500.0,
                                0.0,100.0,200.0,300.0,400.0]
        
        testCorneredSortFunction(withCorner: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftCorneredSortFunction() {
        let expected = [400.0,500.0,600.0,700.0,800.0,
                        300.0,400.0,500.0,600.0,700.0,
                        200.0,300.0,400.0,500.0,600.0,
                        100.0,200.0,300.0,400.0,500.0,
                        0.0,100.0,200.0,300.0,400.0]
        let expectedReversed = [400.0,300.0,200.0,100.0,0.0,
                                500.0,400.0,300.0,200.0,100.0,
                                600.0,500.0,400.0,300.0,200.0,
                                700.0,600.0,500.0,400.0,300.0,
                                800.0,700.0,600.0,500.0,400.0]
        
        testCorneredSortFunction(withCorner: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightCorneredSortFunction() {
        let expected = [800.0,700.0,600.0,500.0,400.0,
                        700.0,600.0,500.0,400.0,300.0,
                        600.0,500.0,400.0,300.0,200.0,
                        500.0,400.0,300.0,200.0,100.0,
                        400.0,300.0,200.0,100.0,0.0]
        let expectedReversed = [0.0,100.0,200.0,300.0,400.0,
                                100.0,200.0,300.0,400.0,500.0,
                                200.0,300.0,400.0,500.0,600.0,
                                300.0,400.0,500.0,600.0,700.0,
                                400.0,500.0,600.0,700.0,800.0]
        
        testCorneredSortFunction(withCorner: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
