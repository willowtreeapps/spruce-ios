//
//  InlineSortFunction.swift
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


public struct InlineSortFunction: CornerSortFunction {

    public var interObjectDelay: TimeInterval
    public var reversed: Bool = false
    public var corner: SpruceCorner
    
    public init(corner: SpruceCorner, interObjectDelay: TimeInterval) {
        self.corner = corner
        self.interObjectDelay = interObjectDelay
    }
    
    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView] {
        let comparisonPoint = distancePoint(view: view)
        let subviews = view.subviews(withRecursiveDepth: recursiveDepth)

        var distancedViews = subviews.map {
            return (view: $0, horizontalDistance: comparisonPoint.horizontalDistance(to: $0.referencePoint), verticalDistance: comparisonPoint.verticalDistance(to: $0.referencePoint))
            }.sorted { (left, right) -> Bool in
                if left.verticalDistance < right.verticalDistance {
                    return true
                }
                if left.verticalDistance == right.verticalDistance && left.horizontalDistance < right.horizontalDistance {
                    return true
                }
                return false
            }
        if self.reversed {
            distancedViews.reverse()
        }

        var currentTimeOffset = 0.0
        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            let timedView = SpruceTimedView(spruceView: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }

        return timedViews
    }
}
