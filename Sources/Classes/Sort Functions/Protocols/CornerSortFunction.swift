//
//  CornerSortFunction.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UIKit


/// A representation of the corners of the view
///
/// - topLeft: top left corner of the view
/// - topRight: top right corner of the view
/// - bottomLeft: bottom left corner of the view
/// - bottomRight: bottom right corner of the view
public enum Corner {
    
    /// top left corner of the view
    case topLeft
    
    /// top right corner of the view
    case topRight
    
    /// bottom left corner of the view
    case bottomLeft
    
    /// bottom right corner of the view
    case bottomRight
}


/// A `DistanceSortFunction` that uses a corner attribute to define an animation's starting point.
public protocol CornerSortFunction: DistanceSortFunction {
    
    /// The starting corner for the animation. Views will animate vertically and horizontally from this corner.
    var corner: Corner { get set }
}

public extension CornerSortFunction {
    public func distancePoint(view: UIView, subviews: [View] = []) -> CGPoint {
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
