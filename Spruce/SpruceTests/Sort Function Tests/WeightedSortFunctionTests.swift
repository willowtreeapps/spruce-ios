//
//  WeightedSortFunctionTests.swift
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

class WeightedSortFunctionTests: SortFunctionTests {
    
    func testContinuousWeightedSortFunction(withStartPosition position: Position, horizontalWeight: Weight, verticalWeight: Weight, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = WeightedSortFunction(position: position, horizontalWeight: horizontalWeight, verticalWeight: verticalWeight)
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
    
    func testContinuousWeightedSortFunctionWithEmptyView() {
        let sortFunction = WeightedSortFunction(position: .topLeft)
        let timedViews = sortFunction.weights(for: UIView())
        
        XCTAssertEqual(timedViews.count, 0)
    }
    
    func testTopLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,50.0,100.0,150.0,200.0,
                        50.0,100.0,150.0,200.0,250.0,
                        100.0,150.0,200.0,250.0,300.0,
                        150.0,200.0,250.0,300.0,350.0,
                        200.0,250.0,300.0,350.0,400.0]
        let expectedReversed = [400.0,350.0,300.0,250.0,200.0,
                                350.0,300.0,250.0,200.0,150.0,
                                300.0,250.0,200.0,150.0,100.0,
                                250.0,200.0,150.0,100.0,50.0,
                                200.0,150.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.0,50.0,100.0,150.0,200.0,
                        100.0,150.0,200.0,250.0,300.0,
                        200.0,250.0,300.0,350.0,400.0,
                        300.0,350.0,400.0,450.0,500.0,
                        400.0,450.0,500.0,550.0,600.0]
        let expectedReversed = [600.0,550.0,500.0,450.0,400.0,
                                500.0,450.0,400.0,350.0,300.0,
                                400.0,350.0,300.0,250.0,200.0,
                                300.0,250.0,200.0,150.0,100.0,
                                200.0,150.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,100.0,200.0,300.0,400.0,
                        50.0,150.0,250.0,350.0,450.0,
                        100.0,200.0,300.0,400.0,500.0,
                        150.0,250.0,350.0,450.0,550.0,
                        200.0,300.0,400.0,500.0,600.0]
        let expectedReversed = [600.0,500.0,400.0,300.0,200.0,
                                550.0,450.0,350.0,250.0,150.0,
                                500.0,400.0,300.0,200.0,100.0,
                                450.0,350.0,250.0,150.0,50.0,
                                400.0,300.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
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
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,200.0,400.0,600.0,800.0,
                        50.0,250.0,450.0,650.0,850.0,
                        100.0,300.0,500.0,700.0,900.0,
                        150.0,350.0,550.0,750.0,950.0,
                        200.0,400.0,600.0,800.0,1000.0]
        let expectedReversed = [1000.0,800.0,600.0,400.0,200.0,
                                950.0,750.0,550.0,350.0,150.0,
                                900.0,700.0,500.0,300.0,100.0,
                                850.0,650.0,450.0,250.0,50.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.0,200.0,400.0,600.0,800.0,
                        100.0,300.0,500.0,700.0,900.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        300.0,500.0,700.0,900.0,1100.0,
                        400.0,600.0,800.0,1000.0,1200.0]
        let expectedReversed = [1200.0,1000.0,800.0,600.0,400.0,
                                1100.0,900.0,700.0,500.0,300.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                900.0,700.0,500.0,300.0,100.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.0,200.0,400.0,600.0,800.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        400.0,600.0,800.0,1000.0,1200.0,
                        600.0,800.0,1000.0,1200.0,1400.0,
                        800.0,1000.0,1200.0,1400.0,1600.0]
        let expectedReversed = [1600.0,1400.0,1200.0,1000.0,800.0,
                                1400.0,1200.0,1000.0,800.0,600.0,
                                1200.0,1000.0,800.0,600.0,400.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.0,190.0,380.0,570.0,760.0,
                        500.0,690.0,880.0,1070.0,1260.0,
                        1000.0,1190.0,1380.0,1570.0,1760.0,
                        1500.0,1690.0,1880.0,2070.0,2260.0,
                        2000.0,2190.0,2380.0,2570.0,2760.0]
        let expectedReversed = [2760.0,2570.0,2380.0,2190.0,2000.0,
                                2260.0,2070.0,1880.0,1690.0,1500.0,
                                1760.0,1570.0,1380.0,1190.0,1000.0,
                                1260.0,1070.0,880.0,690.0,500.0,
                                760.0,570.0,380.0,190.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [100.0,50.0,0.0,50.0,100.0,
                        150.0,100.0,50.0,100.0,150.0,
                        200.0,150.0,100.0,150.0,200.0,
                        250.0,200.0,150.0,200.0,250.0,
                        300.0,250.0,200.0,250.0,300.0]
        let expectedReversed = [200.0,250.0,300.0,250.0,200.0,
                                150.0,200.0,250.0,200.0,150.0,
                                100.0,150.0,200.0,150.0,100.0,
                                50.0,100.0,150.0,100.0,50.0,
                                0.0,50.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [100.0,50.0,0.0,50.0,100.0,
                        200.0,150.0,100.0,150.0,200.0,
                        300.0,250.0,200.0,250.0,300.0,
                        400.0,350.0,300.0,350.0,400.0,
                        500.0,450.0,400.0,450.0,500.0]
        let expectedReversed = [400.0,450.0,500.0,450.0,400.0,
                                300.0,350.0,400.0,350.0,300.0,
                                200.0,250.0,300.0,250.0,200.0,
                                100.0,150.0,200.0,150.0,100.0,
                                0.0,50.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,100.0,0.0,100.0,200.0,
                        250.0,150.0,50.0,150.0,250.0,
                        300.0,200.0,100.0,200.0,300.0,
                        350.0,250.0,150.0,250.0,350.0,
                        400.0,300.0,200.0,300.0,400.0]
        let expectedReversed = [200.0,300.0,400.0,300.0,200.0,
                                150.0,250.0,350.0,250.0,150.0,
                                100.0,200.0,300.0,200.0,100.0,
                                50.0,150.0,250.0,150.0,50.0,
                                0.0,100.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [200.0,100.0,0.0,100.0,200.0,
                        300.0,200.0,100.0,200.0,300.0,
                        400.0,300.0,200.0,300.0,400.0,
                        500.0,400.0,300.0,400.0,500.0,
                        600.0,500.0,400.0,500.0,600.0]
        let expectedReversed = [400.0,500.0,600.0,500.0,400.0,
                                300.0,400.0,500.0,400.0,300.0,
                                200.0,300.0,400.0,300.0,200.0,
                                100.0,200.0,300.0,200.0,100.0,
                                0.0,100.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [400.0,200.0,0.0,200.0,400.0,
                        450.0,250.0,50.0,250.0,450.0,
                        500.0,300.0,100.0,300.0,500.0,
                        550.0,350.0,150.0,350.0,550.0,
                        600.0,400.0,200.0,400.0,600.0]
        let expectedReversed = [200.0,400.0,600.0,400.0,200.0,
                                150.0,350.0,550.0,350.0,150.0,
                                100.0,300.0,500.0,300.0,100.0,
                                50.0,250.0,450.0,250.0,50.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [400.0,200.0,0.0,200.0,400.0,
                        500.0,300.0,100.0,300.0,500.0,
                        600.0,400.0,200.0,400.0,600.0,
                        700.0,500.0,300.0,500.0,700.0,
                        800.0,600.0,400.0,600.0,800.0]
        let expectedReversed = [400.0,600.0,800.0,600.0,400.0,
                                300.0,500.0,700.0,500.0,300.0,
                                200.0,400.0,600.0,400.0,200.0,
                                100.0,300.0,500.0,300.0,100.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [400.0,200.0,0.0,200.0,400.0,
                        600.0,400.0,200.0,400.0,600.0,
                        800.0,600.0,400.0,600.0,800.0,
                        1000.0,800.0,600.0,800.0,1000.0,
                        1200.0,1000.0,800.0,1000.0,1200.0]
        let expectedReversed = [800.0,1000.0,1200.0,1000.0,800.0,
                                600.0,800.0,1000.0,800.0,600.0,
                                400.0,600.0,800.0,600.0,400.0,
                                200.0,400.0,600.0,400.0,200.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [380.0,190.0,0.0,190.0,380.0,
                        880.0,690.0,500.0,690.0,880.0,
                        1380.0,1190.0,1000.0,1190.0,1380.0,
                        1880.0,1690.0,1500.0,1690.0,1880.0,
                        2380.0,2190.0,2000.0,2190.0,2380.0]
        let expectedReversed = [2000.0,2190.0,2380.0,2190.0,2000.0,
                                1500.0,1690.0,1880.0,1690.0,1500.0,
                                1000.0,1190.0,1380.0,1190.0,1000.0,
                                500.0,690.0,880.0,690.0,500.0,
                                0.0,190.0,380.0,190.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,150.0,100.0,50.0,0.0,
                        250.0,200.0,150.0,100.0,50.0,
                        300.0,250.0,200.0,150.0,100.0,
                        350.0,300.0,250.0,200.0,150.0,
                        400.0,350.0,300.0,250.0,200.0]
        let expectedReversed = [200.0,250.0,300.0,350.0,400.0,
                                150.0,200.0,250.0,300.0,350.0,
                                100.0,150.0,200.0,250.0,300.0,
                                50.0,100.0,150.0,200.0,250.0,
                                0.0,50.0,100.0,150.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [200.0,150.0,100.0,50.0,0.0,
                        300.0,250.0,200.0,150.0,100.0,
                        400.0,350.0,300.0,250.0,200.0,
                        500.0,450.0,400.0,350.0,300.0,
                        600.0,550.0,500.0,450.0,400.0]
        let expectedReversed = [400.0,450.0,500.0,550.0,600.0,
                                300.0,350.0,400.0,450.0,500.0,
                                200.0,250.0,300.0,350.0,400.0,
                                100.0,150.0,200.0,250.0,300.0,
                                0.0,50.0,100.0,150.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [400.0,300.0,200.0,100.0,0.0,
                        450.0,350.0,250.0,150.0,50.0,
                        500.0,400.0,300.0,200.0,100.0,
                        550.0,450.0,350.0,250.0,150.0,
                        600.0,500.0,400.0,300.0,200.0]
        let expectedReversed = [200.0,300.0,400.0,500.0,600.0,
                                150.0,250.0,350.0,450.0,550.0,
                                100.0,200.0,300.0,400.0,500.0,
                                50.0,150.0,250.0,350.0,450.0,
                                0.0,100.0,200.0,300.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
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
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [800.0,600.0,400.0,200.0,0.0,
                        850.0,650.0,450.0,250.0,50.0,
                        900.0,700.0,500.0,300.0,100.0,
                        950.0,750.0,550.0,350.0,150.0,
                        1000.0,800.0,600.0,400.0,200.0]
        let expectedReversed = [200.0,400.0,600.0,800.0,1000.0,
                                150.0,350.0,550.0,750.0,950.0,
                                100.0,300.0,500.0,700.0,900.0,
                                50.0,250.0,450.0,650.0,850.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [800.0,600.0,400.0,200.0,0.0,
                        900.0,700.0,500.0,300.0,100.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        1100.0,900.0,700.0,500.0,300.0,
                        1200.0,1000.0,800.0,600.0,400.0]
        let expectedReversed = [400.0,600.0,800.0,1000.0,1200.0,
                                300.0,500.0,700.0,900.0,1100.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                100.0,300.0,500.0,700.0,900.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [800.0,600.0,400.0,200.0,0.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        1200.0,1000.0,800.0,600.0,400.0,
                        1400.0,1200.0,1000.0,800.0,600.0,
                        1600.0,1400.0,1200.0,1000.0,800.0]
        let expectedReversed = [800.0,1000.0,1200.0,1400.0,1600.0,
                                600.0,800.0,1000.0,1200.0,1400.0,
                                400.0,600.0,800.0,1000.0,1200.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [760.0,570.0,380.0,190.0,0.0,
                        1260.0,1070.0,880.0,690.0,500.0,
                        1760.0,1570.0,1380.0,1190.0,1000.0,
                        2260.0,2070.0,1880.0,1690.0,1500.0,
                        2760.0,2570.0,2380.0,2190.0,2000.0]
        let expectedReversed = [2000.0,2190.0,2380.0,2570.0,2760.0,
                                1500.0,1690.0,1880.0,2070.0,2260.0,
                                1000.0,1190.0,1380.0,1570.0,1760.0,
                                500.0,690.0,880.0,1070.0,1260.0,
                                0.0,190.0,380.0,570.0,760.0]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [100.0,150.0,200.0,250.0,300.0,
                        50.0,100.0,150.0,200.0,250.0,
                        0.0,50.0,100.0,150.0,200.0,
                        50.0,100.0,150.0,200.0,250.0,
                        100.0,150.0,200.0,250.0,300.0]
        let expectedReversed = [200.0,150.0,100.0,50.0,0.0,
                                250.0,200.0,150.0,100.0,50.0,
                                300.0,250.0,200.0,150.0,100.0,
                                250.0,200.0,150.0,100.0,50.0,
                                200.0,150.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [200.0,250.0,300.0,350.0,400.0,
                        100.0,150.0,200.0,250.0,300.0,
                        0.0,50.0,100.0,150.0,200.0,
                        100.0,150.0,200.0,250.0,300.0,
                        200.0,250.0,300.0,350.0,400.0]
        let expectedReversed = [200.0,150.0,100.0,50.0,0.0,
                                300.0,250.0,200.0,150.0,100.0,
                                400.0,350.0,300.0,250.0,200.0,
                                300.0,250.0,200.0,150.0,100.0,
                                200.0,150.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [100.0,200.0,300.0,400.0,500.0,
                        50.0,150.0,250.0,350.0,450.0,
                        0.0,100.0,200.0,300.0,400.0,
                        50.0,150.0,250.0,350.0,450.0,
                        100.0,200.0,300.0,400.0,500.0]
        let expectedReversed = [400.0,300.0,200.0,100.0,0.0,
                                450.0,350.0,250.0,150.0,50.0,
                                500.0,400.0,300.0,200.0,100.0,
                                450.0,350.0,250.0,150.0,50.0,
                                400.0,300.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [200.0,300.0,400.0,500.0,600.0,
                        100.0,200.0,300.0,400.0,500.0,
                        0.0,100.0,200.0,300.0,400.0,
                        100.0,200.0,300.0,400.0,500.0,
                        200.0,300.0,400.0,500.0,600.0]
        let expectedReversed = [400.0,300.0,200.0,100.0,0.0,
                                500.0,400.0,300.0,200.0,100.0,
                                600.0,500.0,400.0,300.0,200.0,
                                500.0,400.0,300.0,200.0,100.0,
                                400.0,300.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [100.0,300.0,500.0,700.0,900.0,
                        50.0,250.0,450.0,650.0,850.0,
                        0.0,200.0,400.0,600.0,800.0,
                        50.0,250.0,450.0,650.0,850.0,
                        100.0,300.0,500.0,700.0,900.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                850.0,650.0,450.0,250.0,50.0,
                                900.0,700.0,500.0,300.0,100.0,
                                850.0,650.0,450.0,250.0,50.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [200.0,400.0,600.0,800.0,1000.0,
                        100.0,300.0,500.0,700.0,900.0,
                        0.0,200.0,400.0,600.0,800.0,
                        100.0,300.0,500.0,700.0,900.0,
                        200.0,400.0,600.0,800.0,1000.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                900.0,700.0,500.0,300.0,100.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                900.0,700.0,500.0,300.0,100.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [400.0,600.0,800.0,1000.0,1200.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        0.0,200.0,400.0,600.0,800.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        400.0,600.0,800.0,1000.0,1200.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                1200.0,1000.0,800.0,600.0,400.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                800.0,600.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [1000.0,1190.0,1380.0,1570.0,1760.0,
                        500.0,690.0,880.0,1070.0,1260.0,
                        0.0,190.0,380.0,570.0,760.0,
                        500.0,690.0,880.0,1070.0,1260.0,
                        1000.0,1190.0,1380.0,1570.0,1760.0]
        let expectedReversed = [760.0,570.0,380.0,190.0,0.0,
                                1260.0,1070.0,880.0,690.0,500.0,
                                1760.0,1570.0,1380.0,1190.0,1000.0,
                                1260.0,1070.0,880.0,690.0,500.0,
                                760.0,570.0,380.0,190.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,150.0,100.0,150.0,200.0,
                        150.0,100.0,50.0,100.0,150.0,
                        100.0,50.0,0.0,50.0,100.0,
                        150.0,100.0,50.0,100.0,150.0,
                        200.0,150.0,100.0,150.0,200.0]
        let expectedReversed = [0.0,50.0,100.0,50.0,0.0,
                                50.0,100.0,150.0,100.0,50.0,
                                100.0,150.0,200.0,150.0,100.0,
                                50.0,100.0,150.0,100.0,50.0,
                                0.0,50.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [300.0,250.0,200.0,250.0,300.0,
                        200.0,150.0,100.0,150.0,200.0,
                        100.0,50.0,0.0,50.0,100.0,
                        200.0,150.0,100.0,150.0,200.0,
                        300.0,250.0,200.0,250.0,300.0]
        let expectedReversed = [0.0,50.0,100.0,50.0,0.0,
                                100.0,150.0,200.0,150.0,100.0,
                                200.0,250.0,300.0,250.0,200.0,
                                100.0,150.0,200.0,150.0,100.0,
                                0.0,50.0,100.0,50.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [300.0,200.0,100.0,200.0,300.0,
                        250.0,150.0,50.0,150.0,250.0,
                        200.0,100.0,0.0,100.0,200.0,
                        250.0,150.0,50.0,150.0,250.0,
                        300.0,200.0,100.0,200.0,300.0]
        let expectedReversed = [0.0,100.0,200.0,100.0,0.0,
                                50.0,150.0,250.0,150.0,50.0,
                                100.0,200.0,300.0,200.0,100.0,
                                50.0,150.0,250.0,150.0,50.0,
                                0.0,100.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [400.0,300.0,200.0,300.0,400.0,
                        300.0,200.0,100.0,200.0,300.0,
                        200.0,100.0,0.0,100.0,200.0,
                        300.0,200.0,100.0,200.0,300.0,
                        400.0,300.0,200.0,300.0,400.0]
        let expectedReversed = [0.0,100.0,200.0,100.0,0.0,
                                100.0,200.0,300.0,200.0,100.0,
                                200.0,300.0,400.0,300.0,200.0,
                                100.0,200.0,300.0,200.0,100.0,
                                0.0,100.0,200.0,100.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [500.0,300.0,100.0,300.0,500.0,
                        450.0,250.0,50.0,250.0,450.0,
                        400.0,200.0,0.0,200.0,400.0,
                        450.0,250.0,50.0,250.0,450.0,
                        500.0,300.0,100.0,300.0,500.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                50.0,250.0,450.0,250.0,50.0,
                                100.0,300.0,500.0,300.0,100.0,
                                50.0,250.0,450.0,250.0,50.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [600.0,400.0,200.0,400.0,600.0,
                        500.0,300.0,100.0,300.0,500.0,
                        400.0,200.0,0.0,200.0,400.0,
                        500.0,300.0,100.0,300.0,500.0,
                        600.0,400.0,200.0,400.0,600.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                100.0,300.0,500.0,300.0,100.0,
                                200.0,400.0,600.0,400.0,200.0,
                                100.0,300.0,500.0,300.0,100.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [800.0,600.0,400.0,600.0,800.0,
                        600.0,400.0,200.0,400.0,600.0,
                        400.0,200.0,0.0,200.0,400.0,
                        600.0,400.0,200.0,400.0,600.0,
                        800.0,600.0,400.0,600.0,800.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                200.0,400.0,600.0,400.0,200.0,
                                400.0,600.0,800.0,600.0,400.0,
                                200.0,400.0,600.0,400.0,200.0,
                                0.0,200.0,400.0,200.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [1380.0,1190.0,1000.0,1190.0,1380.0,
                        880.0,690.0,500.0,690.0,880.0,
                        380.0,190.0,0.0,190.0,380.0,
                        880.0,690.0,500.0,690.0,880.0,
                        1380.0,1190.0,1000.0,1190.0,1380.0]
        let expectedReversed = [0.0,190.0,380.0,190.0,0.0,
                                500.0,690.0,880.0,690.0,500.0,
                                1000.0,1190.0,1380.0,1190.0,1000.0,
                                500.0,690.0,880.0,690.0,500.0,
                                0.0,190.0,380.0,190.0,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [300.0,250.0,200.0,150.0,100.0,
                        250.0,200.0,150.0,100.0,50.0,
                        200.0,150.0,100.0,50.0,0.0,
                        250.0,200.0,150.0,100.0,50.0,
                        300.0,250.0,200.0,150.0,100.0]
        let expectedReversed = [0.0,50.0,100.0,150.0,200.0,
                                50.0,100.0,150.0,200.0,250.0,
                                100.0,150.0,200.0,250.0,300.0,
                                50.0,100.0,150.0,200.0,250.0,
                                0.0,50.0,100.0,150.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [400.0,350.0,300.0,250.0,200.0,
                        300.0,250.0,200.0,150.0,100.0,
                        200.0,150.0,100.0,50.0,0.0,
                        300.0,250.0,200.0,150.0,100.0,
                        400.0,350.0,300.0,250.0,200.0]
        let expectedReversed = [0.0,50.0,100.0,150.0,200.0,
                                100.0,150.0,200.0,250.0,300.0,
                                200.0,250.0,300.0,350.0,400.0,
                                100.0,150.0,200.0,250.0,300.0,
                                0.0,50.0,100.0,150.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [500.0,400.0,300.0,200.0,100.0,
                        450.0,350.0,250.0,150.0,50.0,
                        400.0,300.0,200.0,100.0,0.0,
                        450.0,350.0,250.0,150.0,50.0,
                        500.0,400.0,300.0,200.0,100.0]
        let expectedReversed = [0.0,100.0,200.0,300.0,400.0,
                                50.0,150.0,250.0,350.0,450.0,
                                100.0,200.0,300.0,400.0,500.0,
                                50.0,150.0,250.0,350.0,450.0,
                                0.0,100.0,200.0,300.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [600.0,500.0,400.0,300.0,200.0,
                        500.0,400.0,300.0,200.0,100.0,
                        400.0,300.0,200.0,100.0,0.0,
                        500.0,400.0,300.0,200.0,100.0,
                        600.0,500.0,400.0,300.0,200.0]
        let expectedReversed = [0.0,100.0,200.0,300.0,400.0,
                                100.0,200.0,300.0,400.0,500.0,
                                200.0,300.0,400.0,500.0,600.0,
                                100.0,200.0,300.0,400.0,500.0,
                                0.0,100.0,200.0,300.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [900.0,700.0,500.0,300.0,100.0,
                        850.0,650.0,450.0,250.0,50.0,
                        800.0,600.0,400.0,200.0,0.0,
                        850.0,650.0,450.0,250.0,50.0,
                        900.0,700.0,500.0,300.0,100.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                50.0,250.0,450.0,650.0,850.0,
                                100.0,300.0,500.0,700.0,900.0,
                                50.0,250.0,450.0,650.0,850.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1000.0,800.0,600.0,400.0,200.0,
                        900.0,700.0,500.0,300.0,100.0,
                        800.0,600.0,400.0,200.0,0.0,
                        900.0,700.0,500.0,300.0,100.0,
                        1000.0,800.0,600.0,400.0,200.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                100.0,300.0,500.0,700.0,900.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                100.0,300.0,500.0,700.0,900.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1200.0,1000.0,800.0,600.0,400.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        800.0,600.0,400.0,200.0,0.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        1200.0,1000.0,800.0,600.0,400.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                400.0,600.0,800.0,1000.0,1200.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                0.0,200.0,400.0,600.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [1760.0,1570.0,1380.0,1190.0,1000.0,
                        1260.0,1070.0,880.0,690.0,500.0,
                        760.0,570.0,380.0,190.0,0.0,
                        1260.0,1070.0,880.0,690.0,500.0,
                        1760.0,1570.0,1380.0,1190.0,1000.0]
        let expectedReversed = [0.0,190.0,380.0,570.0,760.0,
                                500.0,690.0,880.0,1070.0,1260.0,
                                1000.0,1190.0,1380.0,1570.0,1760.0,
                                500.0,690.0,880.0,1070.0,1260.0,
                                0.0,190.0,380.0,570.0,760.0]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,250.0,300.0,350.0,400.0,
                        150.0,200.0,250.0,300.0,350.0,
                        100.0,150.0,200.0,250.0,300.0,
                        50.0,100.0,150.0,200.0,250.0,
                        0.0,50.0,100.0,150.0,200.0]
        let expectedReversed = [200.0,150.0,100.0,50.0,0.0,
                                250.0,200.0,150.0,100.0,50.0,
                                300.0,250.0,200.0,150.0,100.0,
                                350.0,300.0,250.0,200.0,150.0,
                                400.0,350.0,300.0,250.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [400.0,450.0,500.0,550.0,600.0,
                        300.0,350.0,400.0,450.0,500.0,
                        200.0,250.0,300.0,350.0,400.0,
                        100.0,150.0,200.0,250.0,300.0,
                        0.0,50.0,100.0,150.0,200.0]
        let expectedReversed = [200.0,150.0,100.0,50.0,0.0,
                                300.0,250.0,200.0,150.0,100.0,
                                400.0,350.0,300.0,250.0,200.0,
                                500.0,450.0,400.0,350.0,300.0,
                                600.0,550.0,500.0,450.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,300.0,400.0,500.0,600.0,
                        150.0,250.0,350.0,450.0,550.0,
                        100.0,200.0,300.0,400.0,500.0,
                        50.0,150.0,250.0,350.0,450.0,
                        0.0,100.0,200.0,300.0,400.0]
        let expectedReversed = [400.0,300.0,200.0,100.0,0.0,
                                450.0,350.0,250.0,150.0,50.0,
                                500.0,400.0,300.0,200.0,100.0,
                                550.0,450.0,350.0,250.0,150.0,
                                600.0,500.0,400.0,300.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
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
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [200.0,400.0,600.0,800.0,1000.0,
                        150.0,350.0,550.0,750.0,950.0,
                        100.0,300.0,500.0,700.0,900.0,
                        50.0,250.0,450.0,650.0,850.0,
                        0.0,200.0,400.0,600.0,800.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                850.0,650.0,450.0,250.0,50.0,
                                900.0,700.0,500.0,300.0,100.0,
                                950.0,750.0,550.0,350.0,150.0,
                                1000.0,800.0,600.0,400.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [400.0,600.0,800.0,1000.0,1200.0,
                        300.0,500.0,700.0,900.0,1100.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        100.0,300.0,500.0,700.0,900.0,
                        0.0,200.0,400.0,600.0,800.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                900.0,700.0,500.0,300.0,100.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                1100.0,900.0,700.0,500.0,300.0,
                                1200.0,1000.0,800.0,600.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [800.0,1000.0,1200.0,1400.0,1600.0,
                        600.0,800.0,1000.0,1200.0,1400.0,
                        400.0,600.0,800.0,1000.0,1200.0,
                        200.0,400.0,600.0,800.0,1000.0,
                        0.0,200.0,400.0,600.0,800.0]
        let expectedReversed = [800.0,600.0,400.0,200.0,0.0,
                                1000.0,800.0,600.0,400.0,200.0,
                                1200.0,1000.0,800.0,600.0,400.0,
                                1400.0,1200.0,1000.0,800.0,600.0,
                                1600.0,1400.0,1200.0,1000.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [2000.0,2190.0,2380.0,2570.0,2760.0,
                        1500.0,1690.0,1880.0,2070.0,2260.0,
                        1000.0,1190.0,1380.0,1570.0,1760.0,
                        500.0,690.0,880.0,1070.0,1260.0,
                        0.0,190.0,380.0,570.0,760.0]
        let expectedReversed = [760.0,570.0,380.0,190.0,0.0,
                                1260.0,1070.0,880.0,690.0,500.0,
                                1760.0,1570.0,1380.0,1190.0,1000.0,
                                2260.0,2070.0,1880.0,1690.0,1500.0,
                                2760.0,2570.0,2380.0,2190.0,2000.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [300.0,250.0,200.0,250.0,300.0,
                        250.0,200.0,150.0,200.0,250.0,
                        200.0,150.0,100.0,150.0,200.0,
                        150.0,100.0,50.0,100.0,150.0,
                        100.0,50.0,0.0,50.0,100.0]
        let expectedReversed = [0.0,50.0,100.0,50.0,0.0,
                                50.0,100.0,150.0,100.0,50.0,
                                100.0,150.0,200.0,150.0,100.0,
                                150.0,200.0,250.0,200.0,150.0,
                                200.0,250.0,300.0,250.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [500.0,450.0,400.0,450.0,500.0,
                        400.0,350.0,300.0,350.0,400.0,
                        300.0,250.0,200.0,250.0,300.0,
                        200.0,150.0,100.0,150.0,200.0,
                        100.0,50.0,0.0,50.0,100.0]
        let expectedReversed = [0.0,50.0,100.0,50.0,0.0,
                                100.0,150.0,200.0,150.0,100.0,
                                200.0,250.0,300.0,250.0,200.0,
                                300.0,350.0,400.0,350.0,300.0,
                                400.0,450.0,500.0,450.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [400.0,300.0,200.0,300.0,400.0,
                        350.0,250.0,150.0,250.0,350.0,
                        300.0,200.0,100.0,200.0,300.0,
                        250.0,150.0,50.0,150.0,250.0,
                        200.0,100.0,0.0,100.0,200.0]
        let expectedReversed = [0.0,100.0,200.0,100.0,0.0,
                                50.0,150.0,250.0,150.0,50.0,
                                100.0,200.0,300.0,200.0,100.0,
                                150.0,250.0,350.0,250.0,150.0,
                                200.0,300.0,400.0,300.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [600.0,500.0,400.0,500.0,600.0,
                        500.0,400.0,300.0,400.0,500.0,
                        400.0,300.0,200.0,300.0,400.0,
                        300.0,200.0,100.0,200.0,300.0,
                        200.0,100.0,0.0,100.0,200.0]
        let expectedReversed = [0.0,100.0,200.0,100.0,0.0,
                                100.0,200.0,300.0,200.0,100.0,
                                200.0,300.0,400.0,300.0,200.0,
                                300.0,400.0,500.0,400.0,300.0,
                                400.0,500.0,600.0,500.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [600.0,400.0,200.0,400.0,600.0,
                        550.0,350.0,150.0,350.0,550.0,
                        500.0,300.0,100.0,300.0,500.0,
                        450.0,250.0,50.0,250.0,450.0,
                        400.0,200.0,0.0,200.0,400.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                50.0,250.0,450.0,250.0,50.0,
                                100.0,300.0,500.0,300.0,100.0,
                                150.0,350.0,550.0,350.0,150.0,
                                200.0,400.0,600.0,400.0,200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [800.0,600.0,400.0,600.0,800.0,
                        700.0,500.0,300.0,500.0,700.0,
                        600.0,400.0,200.0,400.0,600.0,
                        500.0,300.0,100.0,300.0,500.0,
                        400.0,200.0,0.0,200.0,400.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                100.0,300.0,500.0,300.0,100.0,
                                200.0,400.0,600.0,400.0,200.0,
                                300.0,500.0,700.0,500.0,300.0,
                                400.0,600.0,800.0,600.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1200.0,1000.0,800.0,1000.0,1200.0,
                        1000.0,800.0,600.0,800.0,1000.0,
                        800.0,600.0,400.0,600.0,800.0,
                        600.0,400.0,200.0,400.0,600.0,
                        400.0,200.0,0.0,200.0,400.0]
        let expectedReversed = [0.0,200.0,400.0,200.0,0.0,
                                200.0,400.0,600.0,400.0,200.0,
                                400.0,600.0,800.0,600.0,400.0,
                                600.0,800.0,1000.0,800.0,600.0,
                                800.0,1000.0,1200.0,1000.0,800.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [2380.0,2190.0,2000.0,2190.0,2380.0,
                        1880.0,1690.0,1500.0,1690.0,1880.0,
                        1380.0,1190.0,1000.0,1190.0,1380.0,
                        880.0,690.0,500.0,690.0,880.0,
                        380.0,190.0,0.0,190.0,380.0]
        let expectedReversed = [0.0,190.0,380.0,190.0,0.0,
                                500.0,690.0,880.0,690.0,500.0,
                                1000.0,1190.0,1380.0,1190.0,1000.0,
                                1500.0,1690.0,1880.0,1690.0,1500.0,
                                2000.0,2190.0,2380.0,2190.0,2000.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [400.0,350.0,300.0,250.0,200.0,
                        350.0,300.0,250.0,200.0,150.0,
                        300.0,250.0,200.0,150.0,100.0,
                        250.0,200.0,150.0,100.0,50.0,
                        200.0,150.0,100.0,50.0,0.0]
        let expectedReversed = [0.0,50.0,100.0,150.0,200.0,
                                50.0,100.0,150.0,200.0,250.0,
                                100.0,150.0,200.0,250.0,300.0,
                                150.0,200.0,250.0,300.0,350.0,
                                200.0,250.0,300.0,350.0,400.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [600.0,550.0,500.0,450.0,400.0,
                        500.0,450.0,400.0,350.0,300.0,
                        400.0,350.0,300.0,250.0,200.0,
                        300.0,250.0,200.0,150.0,100.0,
                        200.0,150.0,100.0,50.0,0.0]
        let expectedReversed = [0.0,50.0,100.0,150.0,200.0,
                                100.0,150.0,200.0,250.0,300.0,
                                200.0,250.0,300.0,350.0,400.0,
                                300.0,350.0,400.0,450.0,500.0,
                                400.0,450.0,500.0,550.0,600.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [600.0,500.0,400.0,300.0,200.0,
                        550.0,450.0,350.0,250.0,150.0,
                        500.0,400.0,300.0,200.0,100.0,
                        450.0,350.0,250.0,150.0,50.0,
                        400.0,300.0,200.0,100.0,0.0]
        let expectedReversed = [0.0,100.0,200.0,300.0,400.0,
                                50.0,150.0,250.0,350.0,450.0,
                                100.0,200.0,300.0,400.0,500.0,
                                150.0,250.0,350.0,450.0,550.0,
                                200.0,300.0,400.0,500.0,600.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
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
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1000.0,800.0,600.0,400.0,200.0,
                        950.0,750.0,550.0,350.0,150.0,
                        900.0,700.0,500.0,300.0,100.0,
                        850.0,650.0,450.0,250.0,50.0,
                        800.0,600.0,400.0,200.0,0.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                50.0,250.0,450.0,650.0,850.0,
                                100.0,300.0,500.0,700.0,900.0,
                                150.0,350.0,550.0,750.0,950.0,
                                200.0,400.0,600.0,800.0,1000.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1200.0,1000.0,800.0,600.0,400.0,
                        1100.0,900.0,700.0,500.0,300.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        900.0,700.0,500.0,300.0,100.0,
                        800.0,600.0,400.0,200.0,0.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                100.0,300.0,500.0,700.0,900.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                300.0,500.0,700.0,900.0,1100.0,
                                400.0,600.0,800.0,1000.0,1200.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1600.0,1400.0,1200.0,1000.0,800.0,
                        1400.0,1200.0,1000.0,800.0,600.0,
                        1200.0,1000.0,800.0,600.0,400.0,
                        1000.0,800.0,600.0,400.0,200.0,
                        800.0,600.0,400.0,200.0,0.0]
        let expectedReversed = [0.0,200.0,400.0,600.0,800.0,
                                200.0,400.0,600.0,800.0,1000.0,
                                400.0,600.0,800.0,1000.0,1200.0,
                                600.0,800.0,1000.0,1200.0,1400.0,
                                800.0,1000.0,1200.0,1400.0,1600.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [2760.0,2570.0,2380.0,2190.0,2000.0,
                        2260.0,2070.0,1880.0,1690.0,1500.0,
                        1760.0,1570.0,1380.0,1190.0,1000.0,
                        1260.0,1070.0,880.0,690.0,500.0,
                        760.0,570.0,380.0,190.0,0.0]
        let expectedReversed = [0.0,190.0,380.0,570.0,760.0,
                                500.0,690.0,880.0,1070.0,1260.0,
                                1000.0,1190.0,1380.0,1570.0,1760.0,
                                1500.0,1690.0,1880.0,2070.0,2260.0,
                                2000.0,2190.0,2380.0,2570.0,2760.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
}

