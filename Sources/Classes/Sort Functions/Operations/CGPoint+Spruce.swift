//
//  CGPoint+Spruce.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/8/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import UIKit


/// Internal struct to access CGPoint extensions. Use this to call methods such as `.euclideanDistance`
public struct SprucePoint {
    
    /// Internal storage of a `CGPoint` to not conflict with namespaces
    internal let point: CGPoint
    
    internal init(point: CGPoint) {
        self.point = point
    }
}

public extension CGPoint {
    
    /// Access point extensions from Spruce. Call methods such as `.euclideanDistance`.
    public var spruce: SprucePoint {
        get {
            return SprucePoint(point: self)
        }
    }
}
