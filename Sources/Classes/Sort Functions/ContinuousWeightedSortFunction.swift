//
//  WeightedContinuousSortFunction.swift
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

/// A `SortFunction` that has variable `interObjectDelay` values using weights to structure when views should animate. Unlike other `SortFunction` implementations, for the `ContinuousWeightedSortFunction` you specify a `duration` and the `SortFunction` will compute the necessary `interObjectDelay` values for each of the subviews. This means that the offset times will not be multiples of the delay like usual. The lighter the weight the faster the views will animate.
/// - Note: If you had a light `verticalWeight` and a heavy `horizontalWeight`, the views that are vertically aligned with the starting position will animate before those that are horizontally aligned. This allows you to define the exact rigidness of a `radial` like `SortFunction`.
/// - Note: Though `interObjectDelay` is a value on this sort function, it will not be used.
/// - Note: The delay values used will be calculated and relative based on how far those views are from the selected position. This means that the animation will look a little smoother if you are using it with large scale numbers of `subviews`.
public struct ContinuousWeightedSortFunction: PositionSortFunction, WeightSortFunction {
    
    public var interObjectDelay: TimeInterval = 0.0
    public var position: Position
    public var reversed: Bool = false
    public var duration: TimeInterval

    public var horizontalWeight: Weight
    public var verticalWeight: Weight

    public init(position: Position, duration: TimeInterval, horizontalWeight: Weight = .medium, verticalWeight: Weight = .medium) {
        self.horizontalWeight = horizontalWeight
        self.verticalWeight = verticalWeight
        self.position = position
        self.duration = duration
    }

    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)

        let distancedViews = subviews.map {
            return (view: $0, horizontalDistance: comparisonPoint.spruce.horizontalDistance(to: $0.referencePoint) * horizontalWeight.coefficient, verticalDistance: comparisonPoint.spruce.verticalDistance(to: $0.referencePoint) * verticalWeight.coefficient)
        }

        guard let maxHorizontalDistance = distancedViews.max(by: { $0.horizontalDistance < $1.horizontalDistance })?.horizontalDistance, let maxVerticalDistance = distancedViews.max(by: { $0.verticalDistance < $1.verticalDistance })?.verticalDistance, maxHorizontalDistance > 0.0, maxVerticalDistance > 0.0 else {
            return []
        }

        var timedViews: [TimedView] = []
        var maxTimeOffset: TimeInterval = 0.0
        for view in distancedViews {
            let normalizedHorizontalDistance = view.horizontalDistance / maxHorizontalDistance
            let normalizedVerticalDistance = view.verticalDistance / maxVerticalDistance
            let offset = duration * (normalizedHorizontalDistance * horizontalWeight.coefficient + normalizedVerticalDistance * verticalWeight.coefficient)
            if offset > maxTimeOffset {
                maxTimeOffset = offset
            }
            let timedView = TimedView(spruceView: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }
        
        for index in 0..<timedViews.count {
            let timeOffset = timedViews[index].timeOffset
            let normalizedTimeOffset = (timeOffset / maxTimeOffset) * duration
            timedViews[index].timeOffset = normalizedTimeOffset
            if reversed {
                timedViews[index].timeOffset = duration - normalizedTimeOffset
            }
        }
        
        return timedViews
    }
}
