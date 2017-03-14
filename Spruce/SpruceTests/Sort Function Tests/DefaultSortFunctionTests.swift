//
//  DefaultSortFunctionTests.swift
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

class DefaultSortFunctionTests: SortFunctionTests {
    
    func testDefaultSortFunction() {
        let sortFunction = DefaultSortFunction(interObjectDelay: 0.1)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.2,0.3,0.4,
                        0.5,0.6,0.7,0.8,0.9,
                        1.0,1.1,1.2,1.3,1.4,
                        1.5,1.6,1.7,1.8,1.9,
                        2.0,2.1,2.2,2.3,2.4]
        compare(timedViews: timedViews, toExpected: expected)
    }
    
    func testNoDelaySortFunction() {
        let sortFunction = DefaultSortFunction()
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        let expected = [0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0]
        compare(timedViews: timedViews, toExpected: expected)
    }

    func testDefaultSortFunctionWithEmptyView() {
        let sortFunction = DefaultSortFunction()
        let timedViews = sortFunction.timeOffsets(view: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
}
