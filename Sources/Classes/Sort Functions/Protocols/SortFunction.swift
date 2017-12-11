//
//  SortFunction.swift
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


/// An internal struct that is used to relate a view with a weight value. This is used to determine when each view is set to animate relatively.
public struct WeightedView {
    
    /// the view that is to be animated
    let spruceView: View
    
    /// the weight applied to this view that is relative to the whole animation
    var weight: Double
}

extension WeightedView: Equatable, Comparable {
    public static func ==(lhs: WeightedView, rhs: WeightedView) -> Bool {
        return lhs.weight == rhs.weight
    }
    
    public static func <(lhs: WeightedView, rhs: WeightedView) -> Bool {
        return lhs.weight < rhs.weight
    }
}


/// For all the views on the screen, we need to find some way of organizing them so that when we start the animation, each view will know when to start their individual animation. The concept of a `SortFunction` is just that. Given a view, the subviews of that view are sorted in a way that when animated they resemble the nature of that sort function. There are many different types of sort functions because there are so many ways to sort the subviews that are on the screen. If you don't see a stock one that fits your need, feel free to implement this protocol and use your own custom `SortFunction` with Spruce.
public protocol SortFunction {
    
    /// Given a view, view sort the subviews in a way that matches the desired specification of the `SortFunction`. In an example case, if you wanted a radial sort function then this method would return an array of the subviews such that their weights would be smaller near the center of the view and grow as they get further from the center point.
    /// - Note: This method simply calls the `weights(forView view: UIView, recursiveDepth: Int)` with a `recursiveDepth` of `0`.
    ///
    /// - Parameter view: the view whose subviews should be animated. This view should not be included in the returned array
    /// - Returns: an array of `WeightedView`'s which contain references to the view needed to be animated and the weight for the animation of that individual view relative to the overall animation
    func weights(forView view: UIView) -> [WeightedView]
    
    /// Given a view, view sort the subviews in a way that matches the desired specification of the `SortFunction`. In an example case, if you wanted a radial sort function then this method would return an array of the subviews such that their weights would be smaller near the center of the view and grow as they get further from the center point.
    ///
    /// - Parameters:
    ///   - view: the view whose subviews should be animated. This view should not be included in the returned array
    ///   - recursiveDepth: an int describing how deep into the view hiearchy the subview search should go, defaults to 0. A value of 0 is the same as calling the `subviews` on the actual view itself. Therefore a depth of 1 will be getting the subviews of each of the subviews, etc...
    /// - Returns: an array of `WeightedView`'s which contain references to the view needed to be animated and the weight for the animation of that individual view relative to the overall animation
    func weights(forView view: UIView, recursiveDepth: Int) -> [WeightedView]
}

public extension SortFunction {
    func weights(forView view: UIView) -> [WeightedView] {
        return weights(forView: view, recursiveDepth: 0)
    }
}
