//
//  ContinuousSortFunction.swift
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

import UIKit

/// A `SortFunction` that has variable `interObjectDelay` values using weights to structure when views should animate. Unlike other `SortFunction` implementations, for the `WeightedSortFunction` you specify a `duration` and the `SortFunction` will compute the necessary `interObjectDelay` values for each of the subviews. This means that the offset times will not be multiples of the delay like usual. The lighter the weight the faster the views will animate.
/// - Note: If you had a light `verticalWeight` and a heavy `horizontalWeight`, the views that are vertically aligned with the starting position will animate before those that are horizontally aligned. This allows you to define the exact rigidness of a `radial` like `SortFunction`.
/// - Note: Though `interObjectDelay` is a value on this sort function, it will not be used.
/// - Note: The delay values used will be calculated and relative based on how far those views are from the selected position. This means that the animation will look a little smoother if you are using it with large scale numbers of `subviews`.
public struct WeightedSortFunction: PositionSortFunction, WeightSortFunction {
    
    public var interObjectDelay: TimeInterval = 0.0
    public var position: Position
    public var reversed: Bool = false

    public var horizontalWeight: Weight
    public var verticalWeight: Weight

    public init(position: Position, horizontalWeight: Weight = .medium, verticalWeight: Weight = .medium) {
        self.horizontalWeight = horizontalWeight
        self.verticalWeight = verticalWeight
        self.position = position
    }
    
    public func weights(for view: UIView, recursiveDepth: Int) -> [WeightedView] {
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)
        var maxWeight: Double = 0.0
        
        var weightedViews: [WeightedView] = subviews.map {
            let horizontalDistance = comparisonPoint.spruce.horizontalDistance(to: $0.referencePoint) * horizontalWeight.coefficient
            let verticalDistance = comparisonPoint.spruce.verticalDistance(to: $0.referencePoint) * verticalWeight.coefficient
            let distance = horizontalDistance + verticalDistance
            maxWeight = max(maxWeight, distance)
            return WeightedView(spruceView: $0, weight: distance)
        }
        
        if reversed {
            for index in 0..<weightedViews.count {
                weightedViews[index].weight = maxWeight - weightedViews[index].weight
            }
        }
        
        return weightedViews
    }
}
