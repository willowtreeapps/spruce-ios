//
//  PositionSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/1/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation
import UIKit

public enum SprucePosition {
    case topLeft
    case topMiddle
    case topRight
    case left
    case middle
    case right
    case bottomLeft
    case bottomMiddle
    case bottomRight
}

public protocol PositionSortFunction: DistanceSortFunction {
    var position: SprucePosition { get set }
}

public extension PositionSortFunction {
    public func getDistancePoint(view: UIView, subviews: [SpruceView]) -> CGPoint {
        let distancePoint: CGPoint
        let bounds = view.bounds
        
        switch position {
        case .topLeft:
            distancePoint = CGPoint.zero
        case .topMiddle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: 0.0)
        case .topRight:
            distancePoint = CGPoint(x: bounds.size.width, y: 0.0)
        case .left:
            distancePoint = CGPoint(x: 0.0, y: (bounds.size.height / 2.0))
        case .middle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: (bounds.size.height / 2.0))
        case .right:
            distancePoint = CGPoint(x: bounds.size.width, y: (bounds.size.height / 2.0))
        case .bottomLeft:
            distancePoint = CGPoint(x: 0.0, y: bounds.size.height)
        case .bottomMiddle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: bounds.size.height)
        case .bottomRight:
            distancePoint = CGPoint(x: bounds.size.width, y: bounds.size.height)
        }
        
        return translate(distancePoint: distancePoint, intoSubviews: subviews)
    }
}
