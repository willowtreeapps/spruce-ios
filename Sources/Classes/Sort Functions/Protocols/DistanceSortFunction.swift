//
//  DistanceSortFunction.swift
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

public protocol DistanceSortFunction: SortFunction {
    var interObjectDelay: TimeInterval { get set }
    var reversed: Bool { get set }
    
    func getTimeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView]
    func getDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double
    func getDistancePoint(view: UIView, subviews: [SpruceView]) -> CGPoint
    func translate(distancePoint: CGPoint, intoSubviews subviews: [SpruceView]) -> CGPoint
}

public extension DistanceSortFunction {
    func getTimeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView] {
        let subviews = view.getSubviews(recursiveDepth: recursiveDepth)
        let comparisonPoint = getDistancePoint(view: view, subviews: subviews)
        
        let distancedViews = subviews.map {
            return (view: $0, distance: getDistanceBetweenPoints(left: comparisonPoint, right: $0.referencePoint))
            }.sorted { (left, right) -> Bool in
                if reversed {
                    return left.distance > right.distance
                }
                return left.distance < right.distance
        }
        
        guard var lastDistance = distancedViews.first?.distance else {
            return []
        }
        var currentTimeOffset = 0.0
        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            if floor(lastDistance) != floor(view.distance) {
                lastDistance = view.distance
                currentTimeOffset += interObjectDelay
            }
            let timedView = SpruceTimedView(spruceView: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
    
    func getDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double {
        return left.euclideanDistance(to: right)
    }
    
    func translate(distancePoint: CGPoint, intoSubviews subviews: [SpruceView]) -> CGPoint {
        if let referenceView = subviews.min(by: {(left, right) in
            let leftDistance = left.referencePoint.euclideanDistance(to: distancePoint)
            let rightDistance = right.referencePoint.euclideanDistance(to: distancePoint)
            return leftDistance < rightDistance
        }) {
            return referenceView.referencePoint
        }
        return distancePoint
    }
}
