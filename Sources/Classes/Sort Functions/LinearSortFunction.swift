//
//  LinearSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public enum SpruceDirection {
    case topToBottom
    case bottomToTop
    case leftToRight
    case rightToLeft
}

open class LinearSortFunction: BaseDistancedSortFunction {
    let direction: SpruceDirection
    
    public init(direction: SpruceDirection, interObjectDelay: TimeInterval) {
        self.direction = direction
        super.init(interObjectDelay: interObjectDelay)
    }
    
    open override func getDistanceBetweenPoints(left: CGPoint, right: CGPoint) -> Double {
        var left = left
        var right = right
        switch direction {
        case .bottomToTop, .topToBottom:
            left.x = 0.0
            right.x = 0.0
        case .leftToRight, .rightToLeft:
            left.y = 0.0
            right.y = 0.0
        }
        return left.euclideanDistance(right)
    }
    
    open override func getDistancePoint(bounds: CGRect) -> CGPoint {
        switch direction {
        case .topToBottom:
            return CGPoint(x: (bounds.size.width / 2.0), y: 0.0)
        case .bottomToTop:
            return CGPoint(x: (bounds.size.width / 2.0), y: bounds.size.height)
        case .leftToRight:
            return CGPoint(x: 0.0, y: (bounds.size.height / 2.0))
        case .rightToLeft:
            return CGPoint(x: bounds.size.width, y: (bounds.size.height / 2.0))
        }
    }
}
