//
//  BaseDistanceSortFunctionTests.swift
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

class BaseDistanceSortFunctionTests: SortFunctionTests {
    
    func testBaseDistanceSortFunction() {
        let sortFunction = BaseDistancedSortFunction(interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.3,0.5,0.8,
                        0.1,0.2,0.4,0.6,0.9,
                        0.3,0.4,0.5,0.7,1.1,
                        0.5,0.6,0.7,1.0,1.2,
                        0.8,0.9,1.1,1.2,1.3]
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let expectedReversed = [1.3,1.2,1.0,0.8,0.5,
                                1.2,1.1,0.9,0.7,0.4,
                                1.0,0.9,0.8,0.6,0.2,
                                0.8,0.7,0.6,0.3,0.1,
                                0.5,0.4,0.2,0.1,0.0]
        let timedViewsReversed = sortFunction.getTimeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
}
