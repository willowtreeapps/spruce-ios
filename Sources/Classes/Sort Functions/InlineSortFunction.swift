//
//  InlineSortFunction.swift
//  Spruce
//
//  Created by Matt Kauper on 12/20/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import Foundation


open class InlineSortFunction: BaseDistancedSortFunction {

    let corner: SpruceCorner

    public init(corner: SpruceCorner, interObjectDelay: TimeInterval, interRowDelay: TimeInterval) {
        self.corner = corner
        super.init(interObjectDelay: interObjectDelay)
    }
    
    open override func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.getSubviews(recursive: recursive)

        let distancedViews = subviews.map {
            return (view: $0, distance: comparisonPoint.euclideanDistance($0.center), verticalDistance: comparisonPoint.horizontalDistance($0.center))
            }.sorted { (left, right) -> Bool in
                if left.distance < right.distance && left.verticalDistance <= right.verticalDistance {
                    return true
                }
                if left.distance < right.distance {
                    return true
                }
                return false
        }

        guard var lastDistance = distancedViews.first?.distance else {
            return []
        }

        var currentTimeOffset = 0.0
        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            if lastDistance != view.distance {
                lastDistance = view.distance
                currentTimeOffset += interObjectDelay
            }
            let timedView = SpruceTimedView(view: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }

        return timedViews
    }

    func getVerticalDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double {
        return sqrt(Double(pow(left.x - right.x, 2.0)))
    }

    open override func getDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double {
        var left = left
        var right = right
        switch corner {
        case .topLeft, .topRight:
            left.x = 0.0
            right.x = 0.0
        case .bottomLeft, .bottomRight:
            left.y = 0.0
            right.y = 0.0
        }
        return left.euclideanDistance(right)
    }

    open override func getDistancePoint(bounds: CGRect) -> CGPoint {
        switch corner {
        case .topLeft:
            return CGPoint.zero
        case .topRight:
            return CGPoint(x: bounds.size.width, y: 0.0)
        case .bottomLeft:
            return CGPoint(x: 0.0, y: bounds.size.height)
        case .bottomRight:
            return CGPoint(x: bounds.size.width, y: bounds.size.height)
        }
    }
}
