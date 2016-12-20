//
//  PointOperations.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public extension CGPoint {
    public func euclideanDistance(_ point: CGPoint) -> Double {
        let x = Double(pow(self.x - point.x, 2.0))
        let y = Double(pow(self.y - point.y, 2.0))
        return sqrt(x + y)
    }

    public func horizontalDistance(_ point: CGPoint) -> Double {
        let x = Double(pow(self.x - point.x, 2.0))
        return sqrt(x)
    }

    public func verticalDistance(_ point: CGPoint) -> Double {
        let y = Double(pow(self.y - point.y, 2.0))
        return sqrt(y)
    }
}
