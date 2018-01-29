//
//  Spruce.swift
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

/// Defines the options for handling a Spruce animation
///
/// - excludeViews: the views that should be excluded in the Spruce animation
/// - prepare: If set, then Spruce will handle the preparation of the animation for you. Meaning a reverse
/// transform will be applied so that the animation runs smoothly
/// - recursiveDepth: how far into the view hierarchy the animation should run
public enum AnimationOption {
    case excludedViews([UIView])
    case prepare
    case recursiveDepth(Int)
}


/// An internal object that is used to interpret the AnimationOption's
struct AnimationOptionObject {
    var excludedViews: [UIView] = []
    var shouldPrepare: Bool = false
    var recursiveDepth: Int = 0
    
    init(options: [AnimationOption]) {
        for option in options {
            switch option {
            case .excludedViews(let views):
                self.excludedViews = views
            case .prepare:
                self.shouldPrepare = true
            case .recursiveDepth(let depth):
                self.recursiveDepth = depth
            }
        }
    }
}
