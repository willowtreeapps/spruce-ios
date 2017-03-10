//
//  DefaultSortFunction.swift
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


/// The basic `SortFunction`. Use this sort function if you want to animate in all views at the same time and give an `interObjectDelay` of `0.0`. Note that this `SortFunction` will animate the views based on the order they were added to the animation view. This means that the way the views are sorted in the `subviews` array is the way that they will be sorted by this `SortFunction`. 
public struct DefaultSortFunction: SortFunction {
    
    public var interObjectDelay: TimeInterval = 0.0
    
    public init() {
        
    }
    
    public init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    public func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView] {
        var timedViews: [TimedView] = []
        var currentTimeOffset: TimeInterval = 0.0
        let subviews = view.spruce.subviews(withRecursiveDepth: recursiveDepth)
        for subView in subviews {
            let timedView = TimedView(spruceView: subView, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }
        return timedViews
    }
}
