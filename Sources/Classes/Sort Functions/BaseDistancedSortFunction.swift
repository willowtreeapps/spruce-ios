//
//  BaseDistancedSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

open class BaseDistancedSortFunction: SortFunction {
    
    let interObjectDelay: TimeInterval
    open var reversed = false
    
    init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    open func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.subviews
        
        let distancedViews = subviews.map {
            return (view: $0, distance: getDistanceBetweenPoints(left: comparisonPoint, right: $0.center))
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
            if lastDistance != view.distance {
                lastDistance = view.distance
                currentTimeOffset += interObjectDelay
            }
            let timedView = SpruceTimedView(view: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
    
    open func getDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double {
        return left.euclideanDistance(right)
    }
    
    open func getDistancePoint(bounds: CGRect) -> CGPoint {
        return CGPoint.zero
    }
}
