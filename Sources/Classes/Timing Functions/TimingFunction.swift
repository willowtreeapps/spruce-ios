//
//  TimingFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/20/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

/// An internal struct that is used to relate a view with a time offset. This is used to determine when each view is set to animate.
public struct TimedView {
    
    /// the view that is to be animated
    let spruceView: View
    
    /// the offset of this view animating from the start of the overall animation
    var timeOffset: TimeInterval
}


/// A protocol that maps weighted views to actually timed views. This means that you can change the timing function for any of our provided `SortFunction` implementations, or even your own `SortFunction`. When a `SortFunction` returns an array of weighted views, the `TimingFunction` will convert those to actual timed views that can be used with an animation block.
public protocol TimingFunction {
    
    /// Given an array of `WeightedView`'s, return an array of views associated with their TimeOffsets. When the offset animation happens, each view needs to know the delay it should wait before starting.
    ///
    /// - Parameter views: an array of `WeightedView` objects that will be animated
    /// - Returns: an array of `TimedView`'s that will be animated.
    func timeOffsets(forViews views: [WeightedView]) -> [TimedView]
}
