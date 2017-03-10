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


/// A `SortFunction` that has variable `interObjectDelay` values. Unlike other `SortFunction` implementations, for the `ContinuousSortFunction` you specify a `duration` and the `SortFunction` will compute the necessary `interObjectDelay` values for each of the subviews. This means that the offset times will not be multiples of the delay like usual.
/// - Note: Though `interObjectDelay` is a value on this sort function, it will not be used.
/// - Note: The delay values used will be calculated and relative based on how far those views are from the selected position. This means that the animation will look a little smoother if you are using it with large scale numbers of `subviews`.
public struct ContinuousSortFunction: PositionSortFunction {

    public var interObjectDelay: TimeInterval = 0.0
    public var duration: TimeInterval
    public var position: Position
    public var reversed: Bool = false

    public init(position: Position, duration: TimeInterval) {
        self.duration = duration
        self.position = position
    }

    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)

        let distancedViews = subviews.map {
            return (view: $0, distance: comparisonPoint.spruce.euclideanDistance(to: $0.referencePoint))
        }

        guard let maxDistance: Double = distancedViews.max(by: { $0.distance < $1.distance })?.distance , maxDistance > 0 else {
            return []
        }

        var timedViews: [TimedView] = []
        for view in distancedViews {
            let normalizedDistance: Double
            if reversed {
                 normalizedDistance = (maxDistance - view.distance) / maxDistance
            }
            else {
                normalizedDistance = view.distance / maxDistance
            }
            let offset = duration * normalizedDistance
            let timedView = TimedView(spruceView: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }

        return timedViews
    }
}
