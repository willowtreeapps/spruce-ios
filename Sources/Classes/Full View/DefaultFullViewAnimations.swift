//
//  DefaultFullViewAnimations.swift
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
    
    /// Run a spruce style animation on this view. This method is the most basic form of a spruce animation and allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Note: Possible animations include
    ///   - Fading
    ///   - Scaling
    ///   - Translating
    ///   - Rotating
    ///
    ///   See `SpruceStockAnimation` for more details
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    public func spruceUp(withAnimations animations: [SpruceStockAnimation], duration: TimeInterval = 0.3, completion: SpruceCompletionHandler? = nil ) {
        let animation = StandardAnimation(duration: duration)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animation, completion: completion)
    }
    
    /// Run a spruce style animation on this view. This method allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - animationType: style of animation that each view should follow. Don't worry about setting the `changeFunction`. We will set that using the stock animations that you provide. If you have a value there it will be overwritten. (ex: SpringAnimation)
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    public func spruceUp(withAnimations animations: [SpruceStockAnimation], duration: TimeInterval = 0.3, animationType: SpruceAnimation, completion: SpruceCompletionHandler? = nil) {
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animationType, sortFunction: sortFunction, completion: completion)
    }
    
    /// Run a spruce style animation on this view. This method allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - animationType: style of animation that each view should follow. Don't worry about setting the `changeFunction`. We will set that using the stock animations that you provide. If you have a value there it will be overwritten. (ex: SpringAnimation)
    ///   - sortFunction: the `sortFunction` to be used when setting the offsets for each subviews animation
    ///   - prepare: a `bool` as to whether we should run `sprucePrepare` on your view for you. If set to `true`, then we will run `sprucePrepare` right before the animation using the stock animations that you provided. If `false`, then `sprucePrepare` will not run. (default is `true`)
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    public func spruceUp(withAnimations animations: [SpruceStockAnimation], duration: TimeInterval = 0.3, animationType: SpruceAnimation, sortFunction: SortFunction, prepare: Bool = true, completion: SpruceCompletionHandler? = nil) {
        
        if prepare {
            self.sprucePrepare(withAnimations: animations)
        }
        
        /* Create the animations */
        var animationType = animationType
        animationType.changeFunction = { view in
            for animation in animations {
                let animationFunc = animation.animationFunction
                animationFunc(view)
            }
        }
        self.spruceUp(withSortFunction: sortFunction, animation: animationType, completion: completion)
    }
    
    public func sprucePrepare(withAnimations animations: [SpruceStockAnimation], recursiveDepth: Int = 0) {
        /* Reset the views to prepare for the animations */
        let clearFunction: SpruceChangeFunction = { view in
            for animation in animations {
                let clearFunc = animation.prepareFunction
                clearFunc(view)
            }
        }
        
        let isFading = animations.contains(where: { value in
            switch value {
            case .fadeIn:
                return true
            default:
                return false
            }
        })
        
        let subviews = self.subviews(withRecursiveDepth: recursiveDepth)
        UIView.performWithoutAnimation {
            for subView in subviews {
                clearFunction(subView.view)
                if isFading {
                    subView.view.isHidden = false
                }
            }
        }
    }
    
    public func hideAllSubviews(recursiveDepth: Int = 0) {
        let subviews = self.subviews(withRecursiveDepth: recursiveDepth)
        UIView.performWithoutAnimation {
            for subView in subviews {
                subView.view.isHidden = true
            }
        }
    }
}
