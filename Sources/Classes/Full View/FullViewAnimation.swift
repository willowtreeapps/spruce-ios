//
//  FullViewAnimation.swift
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

public extension UIView {
    
    /// Use this method to setup all of your views before the animation occurs. This could include hiding, fading, translating them, etc... 
    ///
    /// - Parameters:
    ///   - recursiveDepth: an int describing how deep into the view hiearchy the subview search should go
    ///   - changeFunction: a function that should be applied to each of the subviews of `this`
    public func sprucePrepare(withRecursiveDepth recursiveDepth: Int = 0, changeFunction: SpruceChangeFunction) {
        let subviews = self.subviews(withRecursiveDepth: recursiveDepth)
        for view in subviews {
            changeFunction(view.view)
        }
    }
    
    
    /// Run a spruce style animation on this view. This is a customized method that allows you to take more control over how the animation progresses.
    ///
    /// - Parameters:
    ///   - sortFunction: the `SortFunction` used to determine the animation offsets for each subview
    ///   - prepare: a closure that will be called with each subview of `this` parent view
    ///   - animation: a `SpruceAnimation` that will be used to animate each subview
    ///   - exclude: an array of views that the animation should skip over
    ///   - recursiveDepth: an int describing how deep into the view hiearchy the subview search should go, defaults to 0
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    public func spruceUp(withSortFunction sortFunction: SortFunction, prepare: SprucePrepareHandler? = nil, animation: SpruceAnimation, exclude: [UIView]? = nil, recursiveDepth: Int = 0, completion: SpruceCompletionHandler? = nil) {
        var timedViews = sortFunction.timeOffsets(view: self, recursiveDepth: recursiveDepth)
        timedViews = timedViews.sorted { (left, right) -> Bool in
            return left.timeOffset < right.timeOffset
        }
        for (index, timedView) in timedViews.enumerated() {
            if let exclude = exclude, exclude.reduce(false, { $0 || $1 == timedView.spruceView.view }) {
                continue
            }


            if let prepare = prepare {
                prepare(timedView.spruceView.view)
            }

            animation.animate(delay: timedView.timeOffset,
                              view: timedView.spruceView.view,
                              completion: ((index == timedViews.count - 1) ? completion : nil))
        }
    }
}
