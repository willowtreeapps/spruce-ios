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
    public var reversed: Bool = false
    
    public init(corner: Corner) {
        self.corner = corner
    }
    
    public func weights(for view: UIView, recursiveDepth: Int) -> [WeightedView] {
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)
        
        var maxWeight: Double = 0.0
        
        var weightedViews: [WeightedView] = subviews.map {
            let distance = Double(abs(comparisonPoint.x - $0.referencePoint.x) + abs(comparisonPoint.y - $0.referencePoint.y))
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
