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
    public func spruceUp(withAnimations animations: [SpruceStockAnimation], duration: TimeInterval = 0.3, completion: SpruceCompletionHandler? = nil ) {
        let animation = StandardAnimation(duration: duration)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animation, completion: completion)
    }
    
    public func spruceUp(withAnimations animations: [SpruceStockAnimation], duration: TimeInterval = 0.3, animationType: SpruceAnimation, completion: SpruceCompletionHandler? = nil) {
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animationType, sortFunction: sortFunction, completion: completion)
    }
    
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
