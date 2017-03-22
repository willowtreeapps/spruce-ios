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

import XCTest
@testable import Spruce

class RadialSortFunctionTests: SortFunctionTests {
    
    func testRadialSortFunction(withPosition position: Position, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = RadialSortFunction(position: position)
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
    
    func testRadialSortFunctionWithEmptyView() {
        let sortFunction = RadialSortFunction(position: .topLeft)
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
    
    func testTopLeftRadialSortFunction() {
        let expected = [0.0,100.0,200.0,300.0,400.0,
                        100.0,141.42135623731,223.606797749979,316.227766016838,412.310562561766,
                        200.0,223.606797749979,282.842712474619,360.555127546399,447.213595499958,
                        300.0,316.227766016838,360.555127546399,424.264068711929,500.0,
                        400.0,412.310562561766,447.213595499958,500.0,565.685424949238]
        let expectedReversed = [565.685424949238,465.685424949238,365.685424949238,265.685424949238,165.685424949238,
                                465.685424949238,424.264068711929,342.078627199259,249.4576589324,153.374862387472,
                                365.685424949238,342.078627199259,282.842712474619,205.130297402839,118.47182944928,
                                265.685424949238,249.4576589324,205.130297402839,141.42135623731,65.685424949238,
                                165.685424949238,153.374862387472,118.47182944928,65.685424949238,0.0]
        testRadialSortFunction(withPosition: .topLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleRadialSortFunction() {
        let expected = [200.0,100.0,0.0,100.0,200.0,
                        223.606797749979,141.42135623731,100.0,141.42135623731,223.606797749979,
                        282.842712474619,223.606797749979,200.0,223.606797749979,282.842712474619,
                        360.555127546399,316.227766016838,300.0,316.227766016838,360.555127546399,
                        447.213595499958,412.310562561766,400.0,412.310562561766,447.213595499958]
        let expectedReversed = [247.213595499958,347.213595499958,447.213595499958,347.213595499958,247.213595499958,
                                223.606797749979,305.792239262648,347.213595499958,305.792239262648,223.606797749979,
                                164.370883025339,223.606797749979,247.213595499958,223.606797749979,164.370883025339,
                                86.658467953559,130.98582948312,147.213595499958,130.98582948312,86.658467953559,
                                0.0,34.9030329381919,47.2135954999579,34.9030329381919,0.0]
        testRadialSortFunction(withPosition: .topMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightRadialSortFunction() {
        let expected = [400.0,300.0,200.0,100.0,0.0,
                        412.310562561766,316.227766016838,223.606797749979,141.42135623731,100.0,
                        447.213595499958,360.555127546399,282.842712474619,223.606797749979,200.0,
                        500.0,424.264068711929,360.555127546399,316.227766016838,300.0,
                        565.685424949238,500.0,447.213595499958,412.310562561766,400.0]
        let expectedReversed = [165.685424949238,265.685424949238,365.685424949238,465.685424949238,565.685424949238,
                                153.374862387472,249.4576589324,342.078627199259,424.264068711929,465.685424949238,
                                118.47182944928,205.130297402839,282.842712474619,342.078627199259,365.685424949238,
                                65.685424949238,141.42135623731,205.130297402839,249.4576589324,265.685424949238,
                                0.0,65.685424949238,118.47182944928,153.374862387472,165.685424949238]
        testRadialSortFunction(withPosition: .topRight, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftRadialSortFunction() {
        let expected = [200.0,223.606797749979,282.842712474619,360.555127546399,447.213595499958,
                        100.0,141.42135623731,223.606797749979,316.227766016838,412.310562561766,
                        0.0,100.0,200.0,300.0,400.0,
                        100.0,141.42135623731,223.606797749979,316.227766016838,412.310562561766,
                        200.0,223.606797749979,282.842712474619,360.555127546399,447.213595499958]
        let expectedReversed = [247.213595499958,223.606797749979,164.370883025339,86.658467953559,0.0,
                                347.213595499958,305.792239262648,223.606797749979,130.98582948312,34.9030329381919,
                                447.213595499958,347.213595499958,247.213595499958,147.213595499958,47.2135954999579,
                                347.213595499958,305.792239262648,223.606797749979,130.98582948312,34.9030329381919,
                                247.213595499958,223.606797749979,164.370883025339,86.658467953559,0.0]
        testRadialSortFunction(withPosition: .left, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleRadialSortFunction() {
        let expected = [282.842712474619,223.606797749979,200.0,223.606797749979,282.842712474619,
                        223.606797749979,141.42135623731,100.0,141.42135623731,223.606797749979,
                        200.0,100.0,0.0,100.0,200.0,
                        223.606797749979,141.42135623731,100.0,141.42135623731,223.606797749979,
                        282.842712474619,223.606797749979,200.0,223.606797749979,282.842712474619]
        let expectedReversed = [0.0,59.2359147246401,82.842712474619,59.2359147246401,0.0,
                                59.2359147246401,141.42135623731,182.842712474619,141.42135623731,59.2359147246401,
                                82.842712474619,182.842712474619,282.842712474619,182.842712474619,82.842712474619,
                                59.2359147246401,141.42135623731,182.842712474619,141.42135623731,59.2359147246401,
                                0.0,59.2359147246401,82.842712474619,59.2359147246401,0.0]
        testRadialSortFunction(withPosition: .middle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightRadialSortFunction() {
        let expected = [447.213595499958,360.555127546399,282.842712474619,223.606797749979,200.0,
                        412.310562561766,316.227766016838,223.606797749979,141.42135623731,100.0,
                        400.0,300.0,200.0,100.0,0.0,
                        412.310562561766,316.227766016838,223.606797749979,141.42135623731,100.0,
                        447.213595499958,360.555127546399,282.842712474619,223.606797749979,200.0]
        let expectedReversed = [0.0,86.658467953559,164.370883025339,223.606797749979,247.213595499958,
                                34.9030329381919,130.98582948312,223.606797749979,305.792239262648,347.213595499958,
                                47.2135954999579,147.213595499958,247.213595499958,347.213595499958,447.213595499958,
                                34.9030329381919,130.98582948312,223.606797749979,305.792239262648,347.213595499958,
                                0.0,86.658467953559,164.370883025339,223.606797749979,247.213595499958]
        testRadialSortFunction(withPosition: .right, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftRadialSortFunction() {
        let expected = [400.0,412.310562561766,447.213595499958,500.0,565.685424949238,
                        300.0,316.227766016838,360.555127546399,424.264068711929,500.0,
                        200.0,223.606797749979,282.842712474619,360.555127546399,447.213595499958,
                        100.0,141.42135623731,223.606797749979,316.227766016838,412.310562561766,
                        0.0,100.0,200.0,300.0,400.0]
        let expectedReversed = [165.685424949238,153.374862387472,118.47182944928,65.685424949238,0.0,
                                265.685424949238,249.4576589324,205.130297402839,141.42135623731,65.685424949238,
                                365.685424949238,342.078627199259,282.842712474619,205.130297402839,118.47182944928,
                                465.685424949238,424.264068711929,342.078627199259,249.4576589324,153.374862387472,
                                565.685424949238,465.685424949238,365.685424949238,265.685424949238,165.685424949238]
        testRadialSortFunction(withPosition: .bottomLeft, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleRadialSortFunction() {
        let expected = [447.213595499958,412.310562561766,400.0,412.310562561766,447.213595499958,
                        360.555127546399,316.227766016838,300.0,316.227766016838,360.555127546399,
                        282.842712474619,223.606797749979,200.0,223.606797749979,282.842712474619,
                        223.606797749979,141.42135623731,100.0,141.42135623731,223.606797749979,
                        200.0,100.0,0.0,100.0,200.0]
        let expectedReversed = [0.0,34.9030329381919,47.2135954999579,34.9030329381919,0.0,
                                86.658467953559,130.98582948312,147.213595499958,130.98582948312,86.658467953559,
                                164.370883025339,223.606797749979,247.213595499958,223.606797749979,164.370883025339,
                                223.606797749979,305.792239262648,347.213595499958,305.792239262648,223.606797749979,
                                247.213595499958,347.213595499958,447.213595499958,347.213595499958,247.213595499958]
        testRadialSortFunction(withPosition: .bottomMiddle, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightRadialSortFunction() {
        let expected = [565.685424949238,500.0,447.213595499958,412.310562561766,400.0,
                        500.0,424.264068711929,360.555127546399,316.227766016838,300.0,
                        447.213595499958,360.555127546399,282.842712474619,223.606797749979,200.0,
                        412.310562561766,316.227766016838,223.606797749979,141.42135623731,100.0,
                        400.0,300.0,200.0,100.0,0.0]
        let expectedReversed = [0.0,65.685424949238,118.47182944928,153.374862387472,165.685424949238,
                                65.685424949238,141.42135623731,205.130297402839,249.4576589324,265.685424949238,
                                118.47182944928,205.130297402839,282.842712474619,342.078627199259,365.685424949238,
                                153.374862387472,249.4576589324,342.078627199259,424.264068711929,465.685424949238,
                                165.685424949238,265.685424949238,365.685424949238,465.685424949238,565.685424949238]
        testRadialSortFunction(withPosition: .bottomRight, expected: expected, expectedReversed: expectedReversed)
    }
}
