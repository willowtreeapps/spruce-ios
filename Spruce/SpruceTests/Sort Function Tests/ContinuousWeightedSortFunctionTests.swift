//
//  ContinuousWeightedSortFunctionTests.swift
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

class ContinuousWeightedSortFunctionTests: SortFunctionTests {
    
    func testContinuousWeightedSortFunction(withStartPosition position: SprucePosition, horizontalWeight: SpruceWeight, verticalWeight: SpruceWeight, expected: [TimeInterval], expectedReversed: [TimeInterval]) {
        var sortFunction = ContinuousWeightedSortFunction(position: position, duration: 1.0, horizontalWeight: horizontalWeight, verticalWeight: verticalWeight)
        let timedViews = sortFunction.timeOffsets(view: animatableView)
        
        compare(timedViews: timedViews, toExpected: expected)
        
        sortFunction.reversed = true
        let timedViewsReversed = sortFunction.timeOffsets(view: animatableView)
        compare(timedViews: timedViewsReversed, toExpected: expectedReversed)
    }
    
    func testTopLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.125,0.25,0.375,0.5,
                        0.125,0.25,0.375,0.5,0.625,
                        0.25,0.375,0.5,0.625,0.75,
                        0.375,0.5,0.625,0.75,0.875,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [1.0,0.875,0.75,0.625,0.5,
                                0.875,0.75,0.625,0.5,0.375,
                                0.75,0.625,0.5,0.375,0.25,
                                0.625,0.5,0.375,0.25,0.125,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.0833333333333333,0.166666666666667,0.25,0.333333333333333,
                        0.166666666666667,0.25,0.333333333333333,0.416666666666667,0.5,
                        0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                        0.5,0.583333333333333,0.666666666666667,0.75,0.833333333333333,
                        0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0]
        let expectedReversed = [1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667,
                                0.833333333333333,0.75,0.666666666666667,0.583333333333333,0.5,
                                0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                                0.5,0.416666666666667,0.333333333333333,0.25,0.166666666666667,
                                0.333333333333333,0.25,0.166666666666667,0.0833333333333334,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                        0.0833333333333333,0.25,0.416666666666667,0.583333333333333,0.75,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                        0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                                0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333334,
                                0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.125,0.25,0.375,0.5,
                        0.125,0.25,0.375,0.5,0.625,
                        0.25,0.375,0.5,0.625,0.75,
                        0.375,0.5,0.625,0.75,0.875,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [1.0,0.875,0.75,0.625,0.5,
                                0.875,0.75,0.625,0.5,0.375,
                                0.75,0.625,0.5,0.375,0.25,
                                0.625,0.5,0.375,0.25,0.125,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.2,0.4,0.6,0.8,
                        0.05,0.25,0.45,0.65,0.85,
                        0.1,0.3,0.5,0.7,0.9,
                        0.15,0.35,0.55,0.75,0.95,
                        0.2,0.4,0.6,0.8,1.0]
        let expectedReversed = [1.0,0.8,0.6,0.4,0.2,
                                0.95,0.75,0.55,0.35,0.15,
                                0.9,0.7,0.5,0.3,0.1,
                                0.85,0.65,0.45,0.25,0.05,
                                0.8,0.6,0.4,0.2,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                        0.0833333333333333,0.25,0.416666666666667,0.583333333333333,0.75,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                        0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                                0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333334,
                                0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.0,0.125,0.25,0.375,0.5,
                        0.125,0.25,0.375,0.5,0.625,
                        0.25,0.375,0.5,0.625,0.75,
                        0.375,0.5,0.625,0.75,0.875,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [1.0,0.875,0.75,0.625,0.5,
                                0.875,0.75,0.625,0.5,0.375,
                                0.75,0.625,0.5,0.375,0.25,
                                0.625,0.5,0.375,0.25,0.125,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.0,0.0688405797101449,0.13768115942029,0.206521739130435,0.27536231884058,
                        0.181159420289855,0.25,0.318840579710145,0.38768115942029,0.456521739130435,
                        0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                        0.543478260869565,0.61231884057971,0.681159420289855,0.75,0.818840579710145,
                        0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0]
        let expectedReversed = [1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942,
                                0.818840579710145,0.75,0.681159420289855,0.61231884057971,0.543478260869565,
                                0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                                0.456521739130435,0.38768115942029,0.318840579710145,0.25,0.181159420289855,
                                0.27536231884058,0.206521739130435,0.13768115942029,0.068840579710145,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topLeft, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.25,0.0,0.25,0.5,
                        0.625,0.375,0.125,0.375,0.625,
                        0.75,0.5,0.25,0.5,0.75,
                        0.875,0.625,0.375,0.625,0.875,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.5,0.75,1.0,0.75,0.5,
                                0.375,0.625,0.875,0.625,0.375,
                                0.25,0.5,0.75,0.5,0.25,
                                0.125,0.375,0.625,0.375,0.125,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.166666666666667,0.0,0.166666666666667,0.333333333333333,
                        0.5,0.333333333333333,0.166666666666667,0.333333333333333,0.5,
                        0.666666666666667,0.5,0.333333333333333,0.5,0.666666666666667,
                        0.833333333333333,0.666666666666667,0.5,0.666666666666667,0.833333333333333,
                        1.0,0.833333333333333,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [0.666666666666667,0.833333333333333,1.0,0.833333333333333,0.666666666666667,
                                0.5,0.666666666666667,0.833333333333333,0.666666666666667,0.5,
                                0.333333333333333,0.5,0.666666666666667,0.5,0.333333333333333,
                                0.166666666666667,0.333333333333333,0.5,0.333333333333333,0.166666666666667,
                                0.0,0.166666666666667,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667,
                        0.75,0.416666666666667,0.0833333333333333,0.416666666666667,0.75,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.916666666666667,0.583333333333333,0.25,0.583333333333333,0.916666666666667,
                        1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0]
        let expectedReversed = [0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333,
                                0.25,0.583333333333333,0.916666666666667,0.583333333333333,0.25,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.0833333333333334,0.416666666666667,0.75,0.416666666666667,0.0833333333333334,
                                0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.25,0.0,0.25,0.5,
                        0.625,0.375,0.125,0.375,0.625,
                        0.75,0.5,0.25,0.5,0.75,
                        0.875,0.625,0.375,0.625,0.875,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.5,0.75,1.0,0.75,0.5,
                                0.375,0.625,0.875,0.625,0.375,
                                0.25,0.5,0.75,0.5,0.25,
                                0.125,0.375,0.625,0.375,0.125,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.8,0.4,0.0,0.4,0.8,
                        0.85,0.45,0.05,0.45,0.85,
                        0.9,0.5,0.1,0.5,0.9,
                        0.95,0.55,0.15,0.55,0.95,
                        1.0,0.6,0.2,0.6,1.0]
        let expectedReversed = [0.2,0.6,1.0,0.6,0.2,
                                0.15,0.55,0.95,0.55,0.15,
                                0.1,0.5,0.9,0.5,0.1,
                                0.05,0.45,0.85,0.45,0.05,
                                0.0,0.4,0.8,0.4,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667,
                        0.75,0.416666666666667,0.0833333333333333,0.416666666666667,0.75,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.916666666666667,0.583333333333333,0.25,0.583333333333333,0.916666666666667,
                        1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0]
        let expectedReversed = [0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333,
                                0.25,0.583333333333333,0.916666666666667,0.583333333333333,0.25,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.0833333333333334,0.416666666666667,0.75,0.416666666666667,0.0833333333333334,
                                0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.25,0.0,0.25,0.5,
                        0.625,0.375,0.125,0.375,0.625,
                        0.75,0.5,0.25,0.5,0.75,
                        0.875,0.625,0.375,0.625,0.875,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.5,0.75,1.0,0.75,0.5,
                                0.375,0.625,0.875,0.625,0.375,
                                0.25,0.5,0.75,0.5,0.25,
                                0.125,0.375,0.625,0.375,0.125,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.27536231884058,0.13768115942029,0.0,0.13768115942029,0.27536231884058,
                        0.456521739130435,0.318840579710145,0.181159420289855,0.318840579710145,0.456521739130435,
                        0.63768115942029,0.5,0.36231884057971,0.5,0.63768115942029,
                        0.818840579710145,0.681159420289855,0.543478260869565,0.681159420289855,0.818840579710145,
                        1.0,0.86231884057971,0.72463768115942,0.86231884057971,1.0]
        let expectedReversed = [0.72463768115942,0.86231884057971,1.0,0.86231884057971,0.72463768115942,
                                0.543478260869565,0.681159420289855,0.818840579710145,0.681159420289855,0.543478260869565,
                                0.36231884057971,0.5,0.63768115942029,0.5,0.36231884057971,
                                0.181159420289855,0.318840579710145,0.456521739130435,0.318840579710145,0.181159420289855,
                                0.0,0.13768115942029,0.27536231884058,0.13768115942029,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .topMiddle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.375,0.25,0.125,0.0,
                        0.625,0.5,0.375,0.25,0.125,
                        0.75,0.625,0.5,0.375,0.25,
                        0.875,0.75,0.625,0.5,0.375,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.5,0.625,0.75,0.875,1.0,
                                0.375,0.5,0.625,0.75,0.875,
                                0.25,0.375,0.5,0.625,0.75,
                                0.125,0.25,0.375,0.5,0.625,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.25,0.166666666666667,0.0833333333333333,0.0,
                        0.5,0.416666666666667,0.333333333333333,0.25,0.166666666666667,
                        0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                        0.833333333333333,0.75,0.666666666666667,0.583333333333333,0.5,
                        1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667]
        let expectedReversed = [0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0,
                                0.5,0.583333333333333,0.666666666666667,0.75,0.833333333333333,
                                0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                                0.166666666666667,0.25,0.333333333333333,0.416666666666667,0.5,
                                0.0,0.0833333333333334,0.166666666666667,0.25,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                        0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333333,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                        1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        let expectedReversed = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                                0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.0833333333333334,0.25,0.416666666666667,0.583333333333333,0.75,
                                0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.375,0.25,0.125,0.0,
                        0.625,0.5,0.375,0.25,0.125,
                        0.75,0.625,0.5,0.375,0.25,
                        0.875,0.75,0.625,0.5,0.375,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.5,0.625,0.75,0.875,1.0,
                                0.375,0.5,0.625,0.75,0.875,
                                0.25,0.375,0.5,0.625,0.75,
                                0.125,0.25,0.375,0.5,0.625,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.8,0.6,0.4,0.2,0.0,
                        0.85,0.65,0.45,0.25,0.05,
                        0.9,0.7,0.5,0.3,0.1,
                        0.95,0.75,0.55,0.35,0.15,
                        1.0,0.8,0.6,0.4,0.2]
        let expectedReversed = [0.2,0.4,0.6,0.8,1.0,
                                0.15,0.35,0.55,0.75,0.95,
                                0.1,0.3,0.5,0.7,0.9,
                                0.05,0.25,0.45,0.65,0.85,
                                0.0,0.2,0.4,0.6,0.8]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                        0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333333,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                        1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        let expectedReversed = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                                0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.0833333333333334,0.25,0.416666666666667,0.583333333333333,0.75,
                                0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.375,0.25,0.125,0.0,
                        0.625,0.5,0.375,0.25,0.125,
                        0.75,0.625,0.5,0.375,0.25,
                        0.875,0.75,0.625,0.5,0.375,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.5,0.625,0.75,0.875,1.0,
                                0.375,0.5,0.625,0.75,0.875,
                                0.25,0.375,0.5,0.625,0.75,
                                0.125,0.25,0.375,0.5,0.625,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testTopRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.27536231884058,0.206521739130435,0.13768115942029,0.0688405797101449,0.0,
                        0.456521739130435,0.38768115942029,0.318840579710145,0.25,0.181159420289855,
                        0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                        0.818840579710145,0.75,0.681159420289855,0.61231884057971,0.543478260869565,
                        1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942]
        let expectedReversed = [0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0,
                                0.543478260869565,0.61231884057971,0.681159420289855,0.75,0.818840579710145,
                                0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                                0.181159420289855,0.25,0.318840579710145,0.38768115942029,0.456521739130435,
                                0.0,0.068840579710145,0.13768115942029,0.206521739130435,0.27536231884058]
        testContinuousWeightedSortFunction(withStartPosition: .topRight, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.25,0.375,0.5,0.625,0.75,
                        0.0,0.125,0.25,0.375,0.5,
                        0.25,0.375,0.5,0.625,0.75,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.75,0.625,0.5,0.375,0.25,
                                1.0,0.875,0.75,0.625,0.5,
                                0.75,0.625,0.5,0.375,0.25,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0,
                        0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                        0.0,0.0833333333333333,0.166666666666667,0.25,0.333333333333333,
                        0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                        0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0]
        let expectedReversed = [0.333333333333333,0.25,0.166666666666667,0.0833333333333334,0.0,
                                0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                                1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667,
                                0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                                0.333333333333333,0.25,0.166666666666667,0.0833333333333334,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.25,0.375,0.5,0.625,0.75,
                        0.0,0.125,0.25,0.375,0.5,
                        0.25,0.375,0.5,0.625,0.75,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.75,0.625,0.5,0.375,0.25,
                                1.0,0.875,0.75,0.625,0.5,
                                0.75,0.625,0.5,0.375,0.25,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.2,0.4,0.6,0.8,1.0,
                        0.1,0.3,0.5,0.7,0.9,
                        0.0,0.2,0.4,0.6,0.8,
                        0.1,0.3,0.5,0.7,0.9,
                        0.2,0.4,0.6,0.8,1.0]
        let expectedReversed = [0.8,0.6,0.4,0.2,0.0,
                                0.9,0.7,0.5,0.3,0.1,
                                1.0,0.8,0.6,0.4,0.2,
                                0.9,0.7,0.5,0.3,0.1,
                                0.8,0.6,0.4,0.2,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.25,0.375,0.5,0.625,0.75,
                        0.0,0.125,0.25,0.375,0.5,
                        0.25,0.375,0.5,0.625,0.75,
                        0.5,0.625,0.75,0.875,1.0]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.75,0.625,0.5,0.375,0.25,
                                1.0,0.875,0.75,0.625,0.5,
                                0.75,0.625,0.5,0.375,0.25,
                                0.5,0.375,0.25,0.125,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0,
                        0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                        0.0,0.0688405797101449,0.13768115942029,0.206521739130435,0.27536231884058,
                        0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                        0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0]
        let expectedReversed = [0.27536231884058,0.206521739130435,0.13768115942029,0.068840579710145,0.0,
                                0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                                1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942,
                                0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                                0.27536231884058,0.206521739130435,0.13768115942029,0.068840579710145,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .left, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.75,0.5,0.25,0.5,0.75,
                        0.5,0.25,0.0,0.25,0.5,
                        0.75,0.5,0.25,0.5,0.75,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.25,0.5,0.75,0.5,0.25,
                                0.5,0.75,1.0,0.75,0.5,
                                0.25,0.5,0.75,0.5,0.25,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.833333333333333,1.0,
                        0.666666666666667,0.5,0.333333333333333,0.5,0.666666666666667,
                        0.333333333333333,0.166666666666667,0.0,0.166666666666667,0.333333333333333,
                        0.666666666666667,0.5,0.333333333333333,0.5,0.666666666666667,
                        1.0,0.833333333333333,0.666666666666667,0.833333333333333,1.0]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.166666666666667,0.0,
                                0.333333333333333,0.5,0.666666666666667,0.5,0.333333333333333,
                                0.666666666666667,0.833333333333333,1.0,0.833333333333333,0.666666666666667,
                                0.333333333333333,0.5,0.666666666666667,0.5,0.333333333333333,
                                0.0,0.166666666666667,0.333333333333333,0.166666666666667,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0]
        let expectedReversed = [0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.75,0.5,0.25,0.5,0.75,
                        0.5,0.25,0.0,0.25,0.5,
                        0.75,0.5,0.25,0.5,0.75,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.25,0.5,0.75,0.5,0.25,
                                0.5,0.75,1.0,0.75,0.5,
                                0.25,0.5,0.75,0.5,0.25,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.6,0.2,0.6,1.0,
                        0.9,0.5,0.1,0.5,0.9,
                        0.8,0.4,0.0,0.4,0.8,
                        0.9,0.5,0.1,0.5,0.9,
                        1.0,0.6,0.2,0.6,1.0]
        let expectedReversed = [0.0,0.4,0.8,0.4,0.0,
                                0.1,0.5,0.9,0.5,0.1,
                                0.2,0.6,1.0,0.6,0.2,
                                0.1,0.5,0.9,0.5,0.1,
                                0.0,0.4,0.8,0.4,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0]
        let expectedReversed = [0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.75,0.5,0.25,0.5,0.75,
                        0.5,0.25,0.0,0.25,0.5,
                        0.75,0.5,0.25,0.5,0.75,
                        1.0,0.75,0.5,0.75,1.0]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.25,0.5,0.75,0.5,0.25,
                                0.5,0.75,1.0,0.75,0.5,
                                0.25,0.5,0.75,0.5,0.25,
                                0.0,0.25,0.5,0.25,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [1.0,0.86231884057971,0.72463768115942,0.86231884057971,1.0,
                        0.63768115942029,0.5,0.36231884057971,0.5,0.63768115942029,
                        0.27536231884058,0.13768115942029,0.0,0.13768115942029,0.27536231884058,
                        0.63768115942029,0.5,0.36231884057971,0.5,0.63768115942029,
                        1.0,0.86231884057971,0.72463768115942,0.86231884057971,1.0]
        let expectedReversed = [0.0,0.13768115942029,0.27536231884058,0.13768115942029,0.0,
                                0.36231884057971,0.5,0.63768115942029,0.5,0.36231884057971,
                                0.72463768115942,0.86231884057971,1.0,0.86231884057971,0.72463768115942,
                                0.36231884057971,0.5,0.63768115942029,0.5,0.36231884057971,
                                0.0,0.13768115942029,0.27536231884058,0.13768115942029,0.0]
        testContinuousWeightedSortFunction(withStartPosition: .middle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.75,0.625,0.5,0.375,0.25,
                        0.5,0.375,0.25,0.125,0.0,
                        0.75,0.625,0.5,0.375,0.25,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.25,0.375,0.5,0.625,0.75,
                                0.5,0.625,0.75,0.875,1.0,
                                0.25,0.375,0.5,0.625,0.75,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667,
                        0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                        0.333333333333333,0.25,0.166666666666667,0.0833333333333333,0.0,
                        0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                        1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667]
        let expectedReversed = [0.0,0.0833333333333334,0.166666666666667,0.25,0.333333333333333,
                                0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                                0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0,
                                0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                                0.0,0.0833333333333334,0.166666666666667,0.25,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.75,0.625,0.5,0.375,0.25,
                        0.5,0.375,0.25,0.125,0.0,
                        0.75,0.625,0.5,0.375,0.25,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.25,0.375,0.5,0.625,0.75,
                                0.5,0.625,0.75,0.875,1.0,
                                0.25,0.375,0.5,0.625,0.75,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.8,0.6,0.4,0.2,
                        0.9,0.7,0.5,0.3,0.1,
                        0.8,0.6,0.4,0.2,0.0,
                        0.9,0.7,0.5,0.3,0.1,
                        1.0,0.8,0.6,0.4,0.2]
        let expectedReversed = [0.0,0.2,0.4,0.6,0.8,
                                0.1,0.3,0.5,0.7,0.9,
                                0.2,0.4,0.6,0.8,1.0,
                                0.1,0.3,0.5,0.7,0.9,
                                0.0,0.2,0.4,0.6,0.8]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.75,0.625,0.5,0.375,0.25,
                        0.5,0.375,0.25,0.125,0.0,
                        0.75,0.625,0.5,0.375,0.25,
                        1.0,0.875,0.75,0.625,0.5]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.25,0.375,0.5,0.625,0.75,
                                0.5,0.625,0.75,0.875,1.0,
                                0.25,0.375,0.5,0.625,0.75,
                                0.0,0.125,0.25,0.375,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942,
                        0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                        0.27536231884058,0.206521739130435,0.13768115942029,0.0688405797101449,0.0,
                        0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                        1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942]
        let expectedReversed = [0.0,0.068840579710145,0.13768115942029,0.206521739130435,0.27536231884058,
                                0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                                0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0,
                                0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                                0.0,0.068840579710145,0.13768115942029,0.206521739130435,0.27536231884058]
        testContinuousWeightedSortFunction(withStartPosition: .right, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.375,0.5,0.625,0.75,0.875,
                        0.25,0.375,0.5,0.625,0.75,
                        0.125,0.25,0.375,0.5,0.625,
                        0.0,0.125,0.25,0.375,0.5]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.625,0.5,0.375,0.25,0.125,
                                0.75,0.625,0.5,0.375,0.25,
                                0.875,0.75,0.625,0.5,0.375,
                                1.0,0.875,0.75,0.625,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0,
                        0.5,0.583333333333333,0.666666666666667,0.75,0.833333333333333,
                        0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                        0.166666666666667,0.25,0.333333333333333,0.416666666666667,0.5,
                        0.0,0.0833333333333333,0.166666666666667,0.25,0.333333333333333]
        let expectedReversed = [0.333333333333333,0.25,0.166666666666667,0.0833333333333334,0.0,
                                0.5,0.416666666666667,0.333333333333333,0.25,0.166666666666667,
                                0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                                0.833333333333333,0.75,0.666666666666667,0.583333333333333,0.5,
                                1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                        0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.0833333333333333,0.25,0.416666666666667,0.583333333333333,0.75,
                        0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        let expectedReversed = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                                0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333334,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                                1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.375,0.5,0.625,0.75,0.875,
                        0.25,0.375,0.5,0.625,0.75,
                        0.125,0.25,0.375,0.5,0.625,
                        0.0,0.125,0.25,0.375,0.5]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.625,0.5,0.375,0.25,0.125,
                                0.75,0.625,0.5,0.375,0.25,
                                0.875,0.75,0.625,0.5,0.375,
                                1.0,0.875,0.75,0.625,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [0.2,0.4,0.6,0.8,1.0,
                        0.15,0.35,0.55,0.75,0.95,
                        0.1,0.3,0.5,0.7,0.9,
                        0.05,0.25,0.45,0.65,0.85,
                        0.0,0.2,0.4,0.6,0.8]
        let expectedReversed = [0.8,0.6,0.4,0.2,0.0,
                                0.85,0.65,0.45,0.25,0.05,
                                0.9,0.7,0.5,0.3,0.1,
                                0.95,0.75,0.55,0.35,0.15,
                                1.0,0.8,0.6,0.4,0.2]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0,
                        0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                        0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                        0.0833333333333333,0.25,0.416666666666667,0.583333333333333,0.75,
                        0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667]
        let expectedReversed = [0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0,
                                0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333334,
                                0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                                0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                                1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [0.5,0.625,0.75,0.875,1.0,
                        0.375,0.5,0.625,0.75,0.875,
                        0.25,0.375,0.5,0.625,0.75,
                        0.125,0.25,0.375,0.5,0.625,
                        0.0,0.125,0.25,0.375,0.5]
        let expectedReversed = [0.5,0.375,0.25,0.125,0.0,
                                0.625,0.5,0.375,0.25,0.125,
                                0.75,0.625,0.5,0.375,0.25,
                                0.875,0.75,0.625,0.5,0.375,
                                1.0,0.875,0.75,0.625,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomLeftCustomWeightsWeightedContinousSortFunction() {
        let expected = [0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0,
                        0.543478260869565,0.61231884057971,0.681159420289855,0.75,0.818840579710145,
                        0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                        0.181159420289855,0.25,0.318840579710145,0.38768115942029,0.456521739130435,
                        0.0,0.0688405797101449,0.13768115942029,0.206521739130435,0.27536231884058]
        let expectedReversed = [0.27536231884058,0.206521739130435,0.13768115942029,0.068840579710145,0.0,
                                0.456521739130435,0.38768115942029,0.318840579710145,0.25,0.181159420289855,
                                0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                                0.818840579710145,0.75,0.681159420289855,0.61231884057971,0.543478260869565,
                                1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942]
        testContinuousWeightedSortFunction(withStartPosition: .bottomLeft, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.875,0.625,0.375,0.625,0.875,
                        0.75,0.5,0.25,0.5,0.75,
                        0.625,0.375,0.125,0.375,0.625,
                        0.5,0.25,0.0,0.25,0.5]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.125,0.375,0.625,0.375,0.125,
                                0.25,0.5,0.75,0.5,0.25,
                                0.375,0.625,0.875,0.625,0.375,
                                0.5,0.75,1.0,0.75,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.833333333333333,1.0,
                        0.833333333333333,0.666666666666667,0.5,0.666666666666667,0.833333333333333,
                        0.666666666666667,0.5,0.333333333333333,0.5,0.666666666666667,
                        0.5,0.333333333333333,0.166666666666667,0.333333333333333,0.5,
                        0.333333333333333,0.166666666666667,0.0,0.166666666666667,0.333333333333333]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.166666666666667,0.0,
                                0.166666666666667,0.333333333333333,0.5,0.333333333333333,0.166666666666667,
                                0.333333333333333,0.5,0.666666666666667,0.5,0.333333333333333,
                                0.5,0.666666666666667,0.833333333333333,0.666666666666667,0.5,
                                0.666666666666667,0.833333333333333,1.0,0.833333333333333,0.666666666666667]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0,
                        0.916666666666667,0.583333333333333,0.25,0.583333333333333,0.916666666666667,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.75,0.416666666666667,0.0833333333333333,0.416666666666667,0.75,
                        0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667]
        let expectedReversed = [0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0,
                                0.0833333333333334,0.416666666666667,0.75,0.416666666666667,0.0833333333333334,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.25,0.583333333333333,0.916666666666667,0.583333333333333,0.25,
                                0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.875,0.625,0.375,0.625,0.875,
                        0.75,0.5,0.25,0.5,0.75,
                        0.625,0.375,0.125,0.375,0.625,
                        0.5,0.25,0.0,0.25,0.5]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.125,0.375,0.625,0.375,0.125,
                                0.25,0.5,0.75,0.5,0.25,
                                0.375,0.625,0.875,0.625,0.375,
                                0.5,0.75,1.0,0.75,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.6,0.2,0.6,1.0,
                        0.95,0.55,0.15,0.55,0.95,
                        0.9,0.5,0.1,0.5,0.9,
                        0.85,0.45,0.05,0.45,0.85,
                        0.8,0.4,0.0,0.4,0.8]
        let expectedReversed = [0.0,0.4,0.8,0.4,0.0,
                                0.05,0.45,0.85,0.45,0.05,
                                0.1,0.5,0.9,0.5,0.1,
                                0.15,0.55,0.95,0.55,0.15,
                                0.2,0.6,1.0,0.6,0.2]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.666666666666667,0.333333333333333,0.666666666666667,1.0,
                        0.916666666666667,0.583333333333333,0.25,0.583333333333333,0.916666666666667,
                        0.833333333333333,0.5,0.166666666666667,0.5,0.833333333333333,
                        0.75,0.416666666666667,0.0833333333333333,0.416666666666667,0.75,
                        0.666666666666667,0.333333333333333,0.0,0.333333333333333,0.666666666666667]
        let expectedReversed = [0.0,0.333333333333333,0.666666666666667,0.333333333333333,0.0,
                                0.0833333333333334,0.416666666666667,0.75,0.416666666666667,0.0833333333333334,
                                0.166666666666667,0.5,0.833333333333333,0.5,0.166666666666667,
                                0.25,0.583333333333333,0.916666666666667,0.583333333333333,0.25,
                                0.333333333333333,0.666666666666667,1.0,0.666666666666667,0.333333333333333]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.75,0.5,0.75,1.0,
                        0.875,0.625,0.375,0.625,0.875,
                        0.75,0.5,0.25,0.5,0.75,
                        0.625,0.375,0.125,0.375,0.625,
                        0.5,0.25,0.0,0.25,0.5]
        let expectedReversed = [0.0,0.25,0.5,0.25,0.0,
                                0.125,0.375,0.625,0.375,0.125,
                                0.25,0.5,0.75,0.5,0.25,
                                0.375,0.625,0.875,0.625,0.375,
                                0.5,0.75,1.0,0.75,0.5]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomMiddleCustomWeightsWeightedContinousSortFunction() {
        let expected = [1.0,0.86231884057971,0.72463768115942,0.86231884057971,1.0,
                        0.818840579710145,0.681159420289855,0.543478260869565,0.681159420289855,0.818840579710145,
                        0.63768115942029,0.5,0.36231884057971,0.5,0.63768115942029,
                        0.456521739130435,0.318840579710145,0.181159420289855,0.318840579710145,0.456521739130435,
                        0.27536231884058,0.13768115942029,0.0,0.13768115942029,0.27536231884058]
        let expectedReversed = [0.0,0.13768115942029,0.27536231884058,0.13768115942029,0.0,
                                0.181159420289855,0.318840579710145,0.456521739130435,0.318840579710145,0.181159420289855,
                                0.36231884057971,0.5,0.63768115942029,0.5,0.36231884057971,
                                0.543478260869565,0.681159420289855,0.818840579710145,0.681159420289855,0.543478260869565,
                                0.72463768115942,0.86231884057971,1.0,0.86231884057971,0.72463768115942]
        testContinuousWeightedSortFunction(withStartPosition: .bottomMiddle, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightLightHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.875,0.75,0.625,0.5,0.375,
                        0.75,0.625,0.5,0.375,0.25,
                        0.625,0.5,0.375,0.25,0.125,
                        0.5,0.375,0.25,0.125,0.0]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.125,0.25,0.375,0.5,0.625,
                                0.25,0.375,0.5,0.625,0.75,
                                0.375,0.5,0.625,0.75,0.875,
                                0.5,0.625,0.75,0.875,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .light, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightLightHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.916666666666667,0.833333333333333,0.75,0.666666666666667,
                        0.833333333333333,0.75,0.666666666666667,0.583333333333333,0.5,
                        0.666666666666667,0.583333333333333,0.5,0.416666666666667,0.333333333333333,
                        0.5,0.416666666666667,0.333333333333333,0.25,0.166666666666667,
                        0.333333333333333,0.25,0.166666666666667,0.0833333333333333,0.0]
        let expectedReversed = [0.0,0.0833333333333334,0.166666666666667,0.25,0.333333333333333,
                                0.166666666666667,0.25,0.333333333333333,0.416666666666667,0.5,
                                0.333333333333333,0.416666666666667,0.5,0.583333333333333,0.666666666666667,
                                0.5,0.583333333333333,0.666666666666667,0.75,0.833333333333333,
                                0.666666666666667,0.75,0.833333333333333,0.916666666666667,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .light, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightMediumHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                        0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333333,
                        0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                                0.0833333333333334,0.25,0.416666666666667,0.583333333333333,0.75,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                                0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .medium, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightMediumHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.875,0.75,0.625,0.5,0.375,
                        0.75,0.625,0.5,0.375,0.25,
                        0.625,0.5,0.375,0.25,0.125,
                        0.5,0.375,0.25,0.125,0.0]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.125,0.25,0.375,0.5,0.625,
                                0.25,0.375,0.5,0.625,0.75,
                                0.375,0.5,0.625,0.75,0.875,
                                0.5,0.625,0.75,0.875,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .medium, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalLightVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.8,0.6,0.4,0.2,
                        0.95,0.75,0.55,0.35,0.15,
                        0.9,0.7,0.5,0.3,0.1,
                        0.85,0.65,0.45,0.25,0.05,
                        0.8,0.6,0.4,0.2,0.0]
        let expectedReversed = [0.0,0.2,0.4,0.6,0.8,
                                0.05,0.25,0.45,0.65,0.85,
                                0.1,0.3,0.5,0.7,0.9,
                                0.15,0.35,0.55,0.75,0.95,
                                0.2,0.4,0.6,0.8,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .light, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalMediumVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.833333333333333,0.666666666666667,0.5,0.333333333333333,
                        0.916666666666667,0.75,0.583333333333333,0.416666666666667,0.25,
                        0.833333333333333,0.666666666666667,0.5,0.333333333333333,0.166666666666667,
                        0.75,0.583333333333333,0.416666666666667,0.25,0.0833333333333333,
                        0.666666666666667,0.5,0.333333333333333,0.166666666666667,0.0]
        let expectedReversed = [0.0,0.166666666666667,0.333333333333333,0.5,0.666666666666667,
                                0.0833333333333334,0.25,0.416666666666667,0.583333333333333,0.75,
                                0.166666666666667,0.333333333333333,0.5,0.666666666666667,0.833333333333333,
                                0.25,0.416666666666667,0.583333333333333,0.75,0.916666666666667,
                                0.333333333333333,0.5,0.666666666666667,0.833333333333333,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .medium, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightHeavyHorizontalHeavyVerticalWeightedContinousSortFunction() {
        let expected = [1.0,0.875,0.75,0.625,0.5,
                        0.875,0.75,0.625,0.5,0.375,
                        0.75,0.625,0.5,0.375,0.25,
                        0.625,0.5,0.375,0.25,0.125,
                        0.5,0.375,0.25,0.125,0.0]
        let expectedReversed = [0.0,0.125,0.25,0.375,0.5,
                                0.125,0.25,0.375,0.5,0.625,
                                0.25,0.375,0.5,0.625,0.75,
                                0.375,0.5,0.625,0.75,0.875,
                                0.5,0.625,0.75,0.875,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .heavy, verticalWeight: .heavy, expected: expected, expectedReversed: expectedReversed)
    }
    
    func testBottomRightCustomWeightsWeightedContinousSortFunction() {
        let expected = [1.0,0.931159420289855,0.86231884057971,0.793478260869565,0.72463768115942,
                        0.818840579710145,0.75,0.681159420289855,0.61231884057971,0.543478260869565,
                        0.63768115942029,0.568840579710145,0.5,0.431159420289855,0.36231884057971,
                        0.456521739130435,0.38768115942029,0.318840579710145,0.25,0.181159420289855,
                        0.27536231884058,0.206521739130435,0.13768115942029,0.0688405797101449,0.0]
        let expectedReversed = [0.0,0.068840579710145,0.13768115942029,0.206521739130435,0.27536231884058,
                                0.181159420289855,0.25,0.318840579710145,0.38768115942029,0.456521739130435,
                                0.36231884057971,0.431159420289855,0.5,0.568840579710145,0.63768115942029,
                                0.543478260869565,0.61231884057971,0.681159420289855,0.75,0.818840579710145,
                                0.72463768115942,0.793478260869565,0.86231884057971,0.931159420289855,1.0]
        testContinuousWeightedSortFunction(withStartPosition: .bottomRight, horizontalWeight: .custom(1.9), verticalWeight: .custom(5.0), expected: expected, expectedReversed: expectedReversed)
    }
}

