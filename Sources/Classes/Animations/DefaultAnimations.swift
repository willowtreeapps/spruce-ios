//
//  DefaultAnimations.swift
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

/// Direction that a slide animation should use.
///
/// - up: start the view below its current position, and then slide upwards to where it currently is
/// - down: start the view above its current position, and then slide downwards to where it currently is
/// - left: start the view to the right of its current position, and then slide left to where it currently is
/// - right: start the view to the left of its current position, and then slide right to where it currently is
public enum SlideDirection {
    /// start the view below its current position, and then slide upwards to where it currently is
    case up
    
    /// start the view above its current position, and then slide downwards to where it currently is
    case down
    
    /// start the view to the right of its current position, and then slide left to where it currently is
    case left
    
    /// start the view to the left of its current position, and then slide right to where it currently is
    case right
}

/// How much of an animation change there should be. This value changes based off of which type of `StockAnimation` is used.
///
/// - small: slightly animate the object
/// - medium: the object should move a moderate amount
/// - large: the object should move very noticeably
/// - custom: provide your own value that you feel the object should move
public enum SpruceSize {
    /// slightly animate the object
    case small
    
    /// the object should move a moderate amount
    case medium
    
    /// the object should move very noticeably
    case large
    
    /// provide your own value that you feel the object should move. The value you should provide should be a `Double`
    case custom(Double)
}


/// A few stock animations that you can use with Spruce. We want to make it really easy for you to include animations so we tried to include the basics. Use these stock animations to `slide`, `fade`, `spin`, `expand`, or `contract` your views.
public enum SpruceStockAnimation {
    /// Have your view slide to where it currently is. Provide a `SlideDirection` and `SpruceSize` to determine what the animation should look like.
    case slide(SlideDirection, SpruceSize)
    
    /// Fade the view in
    case fadeIn
    
    /// Spin the view in the direction of the size. Provide a `SpruceSize` to define how much the view should spin
    case spin(SpruceSize)
    
    /// Have the view grow in size. Provide a `SpruceSize` to define by which scale the view should grow
    case expand(SpruceSize)
    
    /// Have the view shrink in size. Provide a `SpruceSize` to define by which scale the view should shrink
    case contract(SpruceSize)
    
    /// Provide custom prepare and change functions for the view to animate
    case custom(prepareFunction: SprucePrepareHandler, animateFunction: SpruceChangeFunction)
    
    /// Given the `StockAnimation`, how should Spruce prepare your view for animation. Since we want all of the views to end the animation where they are supposed to be positioned, we have to reverse their animation effect.
    var prepareFunction: SprucePrepareHandler {
        get {
            switch self {
            case .slide:
                let offset = slideOffset
                return { view in
                    let currentTransform = view.transform
                    let offsetTransform = CGAffineTransform(translationX: offset.x, y: offset.y)
                    view.transform = currentTransform.concatenating(offsetTransform)
                }
            case .fadeIn:
                return { view in
                    view.alpha = 0.0
                }
            case .spin:
                let angle = spinAngle
                return { view in
                    let currentTransform = view.transform
                    let spinTransform = CGAffineTransform(rotationAngle: angle)
                    view.transform = currentTransform.concatenating(spinTransform)
                }
            case .expand, .contract:
                let scale = self.scale
                return { view in
                    let currentTransform = view.transform
                    let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
                    view.transform = currentTransform.concatenating(scaleTransform)
                }
            case .custom(let prepare, _):
                return prepare
            }
        }
    }
    
    
    /// Reset any of the transforms on the view so that the view will end up in its original position. If a `custom` animation is used, then that animation `SpruceChangeFunction` is returned.
    var animationFunction: SpruceChangeFunction {
        get {
            switch self {
            case .slide:
                return { view in
                    view.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                }
            case .fadeIn:
                return { view in
                    view.alpha = 1.0
                }
            case .spin:
                return { view in
                    view.transform = CGAffineTransform(rotationAngle: 0.0)
                }
            case .expand, .contract:
                return { view in
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            case .custom(_, let animation):
                return animation
            }
        }
    }
    
    
    /// Given the animation is a `slide`, return the slide offset
    var slideOffset: CGPoint {
        get {
            switch self {
            case .slide(let direction, let size):
                switch (direction, size) {
                case (.up, .small):
                    return CGPoint(x: 0.0, y: 10.0)
                case (.up, .medium):
                    return CGPoint(x: 0.0, y: 30.0)
                case (.up, .large):
                    return CGPoint(x: 0.0, y: 50.0)
                case (.up, .custom(let value)):
                    return CGPoint(x: 0.0, y: -value)
                case (.down, .small):
                    return CGPoint(x: 0.0, y: -10.0)
                case (.down, .medium):
                    return CGPoint(x: 0.0, y: -30.0)
                case (.down, .large):
                    return CGPoint(x: 0.0, y: -50.0)
                case (.down, .custom(let value)):
                    return CGPoint(x: 0.0, y: -value)
                case (.left, .small):
                    return CGPoint(x: 10.0, y: 0.0)
                case (.left, .medium):
                    return CGPoint(x: 30.0, y: 0.0)
                case (.left, .large):
                    return CGPoint(x: 50.0, y: 0.0)
                case (.left, .custom(let value)):
                    return CGPoint(x:  -value, y: 0.0)
                case (.right, .small):
                    return CGPoint(x: -10.0, y: 0.0)
                case (.right, .medium):
                    return CGPoint(x: -30.0, y: 0.0)
                case (.right, .large):
                    return CGPoint(x: -50.0, y: 0.0)
                case (.right, .custom(let value)):
                    return CGPoint(x:  -value, y: 0.0)
                }
            default:
                return CGPoint.zero
            }
        }
    }
    
    
    /// Given the animation is a `spin`, then this will return the angle that the view should spin.
    var spinAngle: CGFloat {
        get {
            switch self {
            case .spin(let size):
                switch size {
                case .small:
                    return CGFloat(M_PI_4)
                case .medium:
                    return CGFloat(M_PI_2)
                case .large:
                    return CGFloat(M_PI)
                case .custom(let value):
                    return CGFloat(value)
                }
            default:
                return 0.0
            }
        }
    }
    
    /// Given the animation is either `expand` or `contract`, this will return the scale from which the view should grow/shrink
    var scale: CGFloat {
        switch self {
        case .contract(let size):
            switch size {
            case .small:
                return 1.1
            case .medium:
                return 1.3
            case .large:
                return 1.5
            case .custom(let value):
                return CGFloat(value)
            }
        case .expand(let size):
            switch size {
            case .small:
                return 0.9
            case .medium:
                return 0.7
            case .large:
                return 0.5
            case .custom(let value):
                return CGFloat(value)
            }
        default:
            return 0.0
        }
    }
}
