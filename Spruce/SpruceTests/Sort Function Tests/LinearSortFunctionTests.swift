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
@testable import Spruce

class LinearSortFunctionTests: SortFunctionTests {
    
    func testLinearSortFunctions(withDirection direction: Direction, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = LinearSortFunction(direction: direction)
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
    
    func testLinearSortFunctionWithEmptyView() {
        let sortFunction = LinearSortFunction(direction: .topToBottom)
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
    
    func testTopToBottomLinearSortFunction() {
        let expected = [50.0,50.0,50.0,50.0,50.0,
                        150.0,150.0,150.0,150.0,150.0,
                        250.0,250.0,250.0,250.0,250.0,
                        350.0,350.0,350.0,350.0,350.0,
                        450.0,450.0,450.0,450.0,450.0]
        let expectedReversed = [400.0,400.0,400.0,400.0,400.0,
                                300.0,300.0,300.0,300.0,300.0,
                                200.0,200.0,200.0,200.0,200.0,
                                100.0,100.0,100.0,100.0,100.0,
                                0.0,0.0,0.0,0.0,0.0]
        testLinearSortFunctions(withDirection: .topToBottom, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomToTopLinearSortFunction() {
        let expected = [450.0,450.0,450.0,450.0,450.0,
                        350.0,350.0,350.0,350.0,350.0,
                        250.0,250.0,250.0,250.0,250.0,
                        150.0,150.0,150.0,150.0,150.0,
                        50.0,50.0,50.0,50.0,50.0]
        let expectedReversed = [0.0,0.0,0.0,0.0,0.0,
                                100.0,100.0,100.0,100.0,100.0,
                                200.0,200.0,200.0,200.0,200.0,
                                300.0,300.0,300.0,300.0,300.0,
                                400.0,400.0,400.0,400.0,400.0]
        testLinearSortFunctions(withDirection: .bottomToTop, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftToRightLinearSortFunction() {
        let expected = [50.0,150.0,250.0,350.0,450.0,
                        50.0,150.0,250.0,350.0,450.0,
                        50.0,150.0,250.0,350.0,450.0,
                        50.0,150.0,250.0,350.0,450.0,
                        50.0,150.0,250.0,350.0,450.0]
        let expectedReversed = [400.0,300.0,200.0,100.0,0.0,
                                400.0,300.0,200.0,100.0,0.0,
                                400.0,300.0,200.0,100.0,0.0,
                                400.0,300.0,200.0,100.0,0.0,
                                400.0,300.0,200.0,100.0,0.0]
        testLinearSortFunctions(withDirection: .leftToRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightToLeftLinearSortFunction() {
        let expected = [450.0,350.0,250.0,150.0,50.0,
                        450.0,350.0,250.0,150.0,50.0,
                        450.0,350.0,250.0,150.0,50.0,
                        450.0,350.0,250.0,150.0,50.0,
                        450.0,350.0,250.0,150.0,50.0]
        let expectedReversed = [0.0,100.0,200.0,300.0,400.0,
                                0.0,100.0,200.0,300.0,400.0,
                                0.0,100.0,200.0,300.0,400.0,
                                0.0,100.0,200.0,300.0,400.0,
                                0.0,100.0,200.0,300.0,400.0]
        testLinearSortFunctions(withDirection: .rightToLeft, expected: expected, expectedReversed: expectedReversed)
    }
}
