//
//  Animation.swift
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

public typealias ChangeFunction = (_ view: UIView) -> Void
public typealias CompletionHandler = (_ finished: Bool) -> Void
public typealias PrepareHandler = (_ view: UIView) -> Void


/// An animation type that handles how the views will change. Most of these are simply wrappers around the standard `UIViewAnimation` methods. This gives `Spruce` the flexibility to work with any style of animating.
public protocol Animation {
    
    /// Animate the given view using the `changeFunction`.
    ///
    /// - Parameters:
    ///   - delay: the time interval that this animation should wait to start from the moment this method is called
    ///   - view: the view to animate
    ///   - completion: a closure that is called upon the animation completing. A `Bool` is passed into the closure letting you know if the animation has completed.
    func animate(delay: TimeInterval, view: UIView, completion: CompletionHandler?)
    
    /// Given a view, this closure will define the manipulations that will happen to that view
    var changeFunction: ChangeFunction? { get set }
}
