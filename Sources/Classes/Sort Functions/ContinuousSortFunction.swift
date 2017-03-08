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

public struct ContinuousSortFunction: PositionSortFunction {

    public var interObjectDelay: TimeInterval = 0.0
    public var duration: TimeInterval
    public var position: SprucePosition
    public var reversed: Bool = false

    public init(position: SprucePosition, duration: TimeInterval) {
        self.duration = duration
        self.position = position
    }

    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView] {
        let subviews = view.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)

        let distancedViews = subviews.map {
            return (view: $0, distance: comparisonPoint.euclideanDistance(to: $0.referencePoint))
        }

        guard let maxDistance: Double = distancedViews.max(by: { $0.distance < $1.distance })?.distance , maxDistance > 0 else {
            return []
        }

        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            let normalizedDistance: Double
            if reversed {
                 normalizedDistance = (maxDistance - view.distance) / maxDistance
            }
            else {
                normalizedDistance = view.distance / maxDistance
            }
            let offset = duration * normalizedDistance
            let timedView = SpruceTimedView(spruceView: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }

        return timedViews
    }
}
