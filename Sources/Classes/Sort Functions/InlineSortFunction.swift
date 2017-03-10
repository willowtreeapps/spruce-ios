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


/// A `SortFunction` that animates the views in as if they were reading text from left to right (based on the corner that you set). 
/// - Note: If you set any type of right corner, then the views will enter as if you are reading text from right to left.
public struct InlineSortFunction: CornerSortFunction {

    public var interObjectDelay: TimeInterval
    public var reversed: Bool = false
    public var corner: Corner
    
    public init(corner: Corner, interObjectDelay: TimeInterval) {
        self.corner = corner
        self.interObjectDelay = interObjectDelay
    }
    
    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        let comparisonPoint = distancePoint(view: view)
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)

        var distancedViews = subviews.map {
            return (view: $0, horizontalDistance: comparisonPoint.spruce.horizontalDistance(to: $0.referencePoint), verticalDistance: comparisonPoint.spruce.verticalDistance(to: $0.referencePoint))
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
        var timedViews: [TimedView] = []
        for view in distancedViews {
            let timedView = TimedView(spruceView: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }

        return timedViews
    }
}
