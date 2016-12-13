//
//  CorneredSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//
//

import UIKit

public enum SpruceCorner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

open class CorneredSortFunction: BaseDistancedSortFunction {
    
    let corner: SpruceCorner
    
    public init(corner: SpruceCorner, interObjectDelay: TimeInterval) {
        self.corner = corner
        super.init(interObjectDelay: interObjectDelay)
    }
    
    open override func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.subviews
        
        let distancedViews = subviews.map {
            return (view: $0, distance: comparisonPoint.euclideanDistance($0.center))
        }.sorted { (left, right) -> Bool in
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
