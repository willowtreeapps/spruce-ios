//
//  DirectionSortFunction.swift
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


/// A representation of a linear direction.
///
/// - topToBottom: the animation will run with top views animating first and then bottom views animating last
/// - bottomToTop: the animation will run with bottom views animating first and then top views animating last
/// - leftToRight: the animation will run with left views animating first and right views animating last
/// - rightToLeft: the animation will run with right views animating first and left views animating last
public enum Direction {
    
    /// the animation will run with top views animating first and then bottom views animating last
    case topToBottom
    
    /// the animation will run with bottom views animating first and then top views animating last
    case bottomToTop
    
    /// the animation will run with left views animating first and right views animating last
    case leftToRight
    
    /// the animation will run with right views animating first and left views animating last
    case rightToLeft
}


/// A `DistanceSortFunction` that defines it's `distancePoint` based on a `Direction`. Any distance based sort functions that use a direction variable in order to determine the setup of the animation should implement this protocol.
public protocol DirectionSortFunction: DistanceSortFunction {
    
    /// the direction that the animation should follow
    var direction: Direction { get set }
}

public extension DirectionSortFunction {
    public func distancePoint(view: UIView, subviews: [View] = []) -> CGPoint {
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
