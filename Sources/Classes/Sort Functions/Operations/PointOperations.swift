//
//  PointOperations.swift
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

public extension SprucePoint {
    
    /// Calculate the euclidean distance between two points
    ///
    /// ```
    /// distance = sqrt((x1 - x2)^2 + (y1 - y2)^2)
    /// ```
    /// - Parameter point: the end point of the line for calculating the distance
    /// - Returns: a double value of the euclidean distance between the two points
    public func euclideanDistance(to point: CGPoint) -> Double {
        let x = Double(pow(self.point.x - point.x, 2.0))
        let y = Double(pow(self.point.y - point.y, 2.0))
        return sqrt(x + y)
    }

    /// Calculate the horizontal euclidean distance between two points. Esentially the same thing as euclideanDistance except it ignores the `y` components of the two points.
    ///
    /// - Parameter point: the end point of the line for calculating the distance
    /// - Returns: a double value of the distance horizontal euclidean between the two points
    public func horizontalDistance(to point: CGPoint) -> Double {
        let x = Double(self.point.x - point.x)
        return abs(x)
    }

    /// Calculate the vertical euclidean distance between two points. Esentially the same thing as euclideanDistance except it ignores the `x` components of the two points.
    ///
    /// - Parameter point: the end point of the line for calculating the distance
    /// - Returns: a double value of the distance vertical euclidean between the two points
    public func verticalDistance(to point: CGPoint) -> Double {
        let y = Double(self.point.y - point.y)
        return abs(y)
    }
}
