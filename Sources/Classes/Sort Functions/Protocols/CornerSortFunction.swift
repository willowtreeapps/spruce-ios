//
//  CornerSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/1/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation
import UIKit

public enum SpruceCorner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

public protocol CornerSortFunction: DistanceSortFunction {
    var corner: SpruceCorner { get set }
}

public extension CornerSortFunction {
    public func getDistancePoint(view: UIView, subviews: [SpruceView] = []) -> CGPoint {
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
