//
//  RadialSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

enum SprucePosition {
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

class RadialSortFunction: BaseDistancedSortFunction {
    let position: SprucePosition
    
    init(position: SprucePosition, interObjectDelay: TimeInterval) {
        self.position = position
        super.init(interObjectDelay: interObjectDelay)
    }
    
    override func getDistancePoint(bounds: CGRect) -> CGPoint {
        switch position {
        case .topLeft:
            return CGPoint.zero
        case .topMiddle:
            return CGPoint(x: (bounds.size.width / 2.0), y: 0.0)
        case .topRight:
            return CGPoint(x: bounds.size.width, y: 0.0)
        case .left:
            return CGPoint(x: 0.0, y: (bounds.size.height / 2.0))
        case .middle:
            return CGPoint(x: (bounds.size.width / 2.0), y: (bounds.size.height / 2.0))
        case .right:
            return CGPoint(x: bounds.size.width, y: (bounds.size.height / 2.0))
        case .bottomLeft:
            return CGPoint(x: 0.0, y: bounds.size.height)
        case .bottomMiddle:
            return CGPoint(x: (bounds.size.width / 2.0), y: bounds.size.height)
        case .bottomRight:
            return CGPoint(x: bounds.size.width, y: bounds.size.height)
        }
    }
}
