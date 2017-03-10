//
//  CorneredSortFunction.swift
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


/// A `SortFunction` designed to animate in a corner like fashion. The views near the starting corner will animate first. In essence it appears to be a wiping function that will continue diagonally based on that corner. 
public struct CorneredSortFunction: CornerSortFunction {
    
    public var corner: Corner
    public var interObjectDelay: TimeInterval
    public var reversed: Bool = false
    
    public init(corner: Corner, interObjectDelay: TimeInterval) {
        self.corner = corner
        self.interObjectDelay = interObjectDelay
    }
    
    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        let comparisonPoint = distancePoint(view: view)
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        
        let distancedViews = subviews.map {
            return (view: $0, distance: abs(comparisonPoint.x - $0.referencePoint.x) + abs(comparisonPoint.y - $0.referencePoint.y))
        }.sorted { (left, right) -> Bool in
            if self.reversed {
                return left.distance > right.distance
            }
            return left.distance < right.distance
        }
        
        guard var lastDistance = distancedViews.first?.distance else {
            return []
        }
        var currentTimeOffset = 0.0
        var timedViews: [TimedView] = []
        for view in distancedViews {
            if floor(lastDistance) != floor(view.distance) {
                lastDistance = view.distance
                currentTimeOffset += interObjectDelay
            }
            let timedView = TimedView(spruceView: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
    
    public func distancePoint(view: UIView, subviews: [View] = []) -> CGPoint {
        let distancePoint: CGPoint
        let bounds = view.bounds
        switch corner {
        case .topLeft:
            distancePoint = CGPoint.zero
        case .topRight:
            distancePoint = CGPoint(x: bounds.size.width, y: 0.0)
        case .bottomLeft:
            distancePoint = CGPoint(x: 0.0, y: bounds.size.height)
        case .bottomRight:
            distancePoint = CGPoint(x: bounds.size.width, y: bounds.size.height)
        }
        return translate(distancePoint: distancePoint, intoSubviews: subviews)
    }
}
