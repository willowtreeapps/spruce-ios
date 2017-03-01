//
//  DirectionSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/1/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation
import UIKit

public protocol DirectionSortFunction: DistanceSortFunction {
    var direction: SpruceDirection { get set }
}

public extension DirectionSortFunction {
    public func getDistancePoint(view: UIView, subviews: [SpruceView] = []) -> CGPoint {
        let bounds = view.bounds
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
