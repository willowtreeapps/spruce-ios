//
//  DistanceSortFunction.swift
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

/// A `SortFunction` implementation that contain basic methods needed for doing distance comparisons. If you are implementing a `SortFunction` that considers distance to be one of it's weighting mechanisms for sorting the views on the screen, then implementing this protocol would provide improvements over the standard `SortFunction`.
public protocol DistanceSortFunction: SortFunction {
    
    /// the time interval of delay between each of the objects on the screen when animating
    var interObjectDelay: TimeInterval { get set }
    
    /// a bool value as to whether the animation should proceeed forwards or backwards
    var reversed: Bool { get set }
    
    /// Compute the distance between two points. This can be any distance metric as long as you keep it consistent. For the default implementation, `euclideanDistance` is used.
    ///
    /// - Parameters:
    ///   - left: the left point
    ///   - right: the right point
    /// - Returns: the distance between the two points.
    func distanceBetween(_ left: CGPoint, and right: CGPoint) -> Double
    
    /// With a `DistanceSortFunction` there has to be some main point that all the views are compared to. Since we understand that this point changes based on some value, you need to implement this method that will return a point for the given `SortFunction` configuration. The `timeOffsets` method will use this to grab a comparison point. From there the further the distance from the point the longer the delay for that view to start animating.
    ///
    /// - Parameters:
    ///   - view: the view for which the point coordinates will base their values off of
    ///   - subviews: the subviews that are allocated for the `SortFunction`. The reason these are passed into the function is so that you can actually grab a reference point of a subview that is closest to the comparison point. This is done so that at least one view will start at the 0s marker.
    /// - Returns: a `CGPoint` object that will allow all views to compare their reference point to this returned value. If `translate` was used, this returned value should be equal to one of the `subviews` reference points.
    func distancePoint(view: UIView, subviews: [View]) -> CGPoint
    
    /// Given a point, find the closest subview to that point and then return the reference point of that subview. This way there will be at least one distance calculation that will have a zero value. We want to make sure that the animation will start right when called, thus there needs to be one view with a zero distance.
    ///
    /// - Parameters:
    ///   - distancePoint: the point on the main view
    ///   - subviews: the subviews of the main view
    /// - Returns: the reference point of the subview that is closest to the `distancePoint`
    func translate(distancePoint: CGPoint, intoSubviews subviews: [View]) -> CGPoint
}

public extension DistanceSortFunction {
    
    /// Given a view, view sort the subviews in a way that matches the desired specification of the `SortFunction`. In an example case, if you wanted a radial sort function then this method would return an array of the subviews such that their time offets would be smaller near the center of the view and grow as they get further from the center point.
    /// - Note: With a `DistanceSortFunction` a comparison point is initially found that helps compute the offsets for each of the views. This comparison point is found by calling the method `distancePoint` on `self`. From there the default implementation is that the further the distance from the `comparisonPoint` to the `referencePoint` of each view the longer the offset. Since this is setup with a `interObjectDelay` every view with the same distance will have the same delay and those with different distances will have an incrementally large delay. For example, consider the distances [1,2,2,3,4]. If we were to analyze those distances with an `interObjectDelay of .1 seconds, then the delays would look like `[0, 0.1, 0.1, 0.2, 0.3]`. Notice that those views with the same distance have the same delay.
    /// - Note: A floor value is taken of the distances when comparing so that floating point operations don't mess up the joining of like distances. Considering that distances are in terms of points on the screen, there was not need to consider half points in reality.
    ///
    /// - Parameters:
    ///   - view: the view whose subviews should be animated. This view should not be included in the returned array
    ///   - recursiveDepth: an int describing how deep into the view hiearchy the subview search should go, defaults to 0. A value of 0 is the same as calling the `subviews` on the actual view itself. Therefore a depth of 1 will be getting the subviews of each of the subviews, etc...
    /// - Returns: an array of `TimedView`'s which contain references to the view needed to be animated and the time offset for when the animation of that individual view should start relative to the start of the overall animation
    func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        let comparisonPoint = distancePoint(view: view, subviews: subviews)
        
        let distancedViews = subviews.map {
            return (view: $0, distance: distanceBetween(comparisonPoint, and: $0.referencePoint))
            }.sorted { (left, right) -> Bool in
                if reversed {
                    return left.distance > right.distance
                }
                return left.distance < right.distance
        }
        
        guard var lastDistance = distancedViews.first?.distance else {
            return []
        }
        var currentTimeOffset = 0.0
        var timedViews: [TimedView] = []
        for view in distancedViews {
            if floor(lastDistance) != floor(view.distance) {
                lastDistance = view.distance
                currentTimeOffset += interObjectDelay
            }
            let timedView = TimedView(spruceView: view.view, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
    
    func distanceBetween(_ left: CGPoint, and right: CGPoint) -> Double {
        return left.spruce.euclideanDistance(to: right)
    }
    
    func translate(distancePoint: CGPoint, intoSubviews subviews: [View]) -> CGPoint {
        if let referenceView = subviews.min(by: {(left, right) in
            let leftDistance = left.referencePoint.spruce.euclideanDistance(to: distancePoint)
            let rightDistance = right.referencePoint.spruce.euclideanDistance(to: distancePoint)
            return leftDistance < rightDistance
        }) {
            return referenceView.referencePoint
        }
        return distancePoint
    }
}
