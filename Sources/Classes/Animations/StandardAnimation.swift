//
//  StandardAnimation.swift
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

/// A wrapper around the standard `UIViewAnimation` block with options publicly accessible. See, [UIViewAnimation](apple-reference-documentation://hsLqXZ_dD1) for more
/// - Note: `animationOptions` defaults to `.curveEaseOut`. If you do not update this value before calling the animate method than the changes will not be reflected.
public struct StandardAnimation: Animation {
    
    public var changeFunction: ChangeFunction?
    public var duration: TimeInterval
    public var animationOptions: UIViewAnimationOptions = .curveEaseOut
    
    public init(duration: TimeInterval) {
        self.duration = duration
    }
    
    public init(duration: TimeInterval, changes: @escaping ChangeFunction) {
        self.init(duration: duration)
        self.changeFunction = changes
    }
    
    public func animate(delay: TimeInterval, view: UIView, completion: CompletionHandler?) {
        UIView.animate(withDuration: duration, delay: delay, options: animationOptions, animations: {
            self.changeFunction?(view)
        }, completion: completion)
    }
}
