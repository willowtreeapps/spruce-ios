//
//  LinearSortFunction.swift
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

import UIKit

/// A `Linear` wiping `SortFunction`. This will consider the rows or columns of the views rather than looking at their exact coordinates. Views that have the same vertical or horizontal components, based on the `direction`, will animate in at the same time.
public struct LinearSortFunction: DirectionSortFunction {
    public var direction: Direction
    public var interObjectDelay: TimeInterval
    public var reversed: Bool = false
    
    public init(direction: Direction, interObjectDelay: TimeInterval) {
        self.direction = direction
        self.interObjectDelay = interObjectDelay
    }
    
    public func distanceBetween(_ left: CGPoint, and right: CGPoint) -> Double {
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
        return left.spruce.euclideanDistance(to: right)
    }
}
