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

/// How much the angle of an animation should change. This value changes based off of which type of `StockAnimation` is used.
///
/// - slightly: slightly animate the object
/// - moderately: the object should move a moderate amount
/// - severely: the object should move very noticeably
/// - toAngle: provide your own angle value that you feel the object should rotate
public enum Angle {
    /// slightly animate the object
    case slightly
    
    /// the object should move a moderate amount
    case moderately
    
    /// the object should move very noticeably
    case severely
    
    /// provide your own value that you feel the object should move. The value you should provide should be a `Double`
    case toAngle(CGFloat)
}

/// How much the scale of an animation should change. This value changes based off of which type of `StockAnimation` is used.
///
/// - slightly: slightly animate the object
/// - moderately: the object should scale a moderate amount
/// - severely: the object should scale very noticeably
/// - toScale: provide your own scale value that you feel the object should grow/shrink
public enum Scale {
    
    /// slightly animate the object
    case slightly
    
    /// the object should scale a moderate amount
    case moderately
    
    /// the object should scale very noticeably
    case severely
    
    /// provide your own scale value that you feel the object should grow/shrink
    case toScale(CGFloat)
}

/// How much the distance of a view animation should change. This value changes based off of which type of `StockAnimation` is used.
///
/// - slightly: slightly move the object
/// - moderately: the object should move a moderate amount
/// - severely: the object should move very noticeably
/// - byPoints: provide your own distance value that you feel the object should slide over
public enum Distance {
    /// slightly move the object
    case slightly
    
    /// the object should move a moderate amount
    case moderately
    
    /// the object should move very noticeably
    case severely
    
    /// provide your own distance value that you feel the object should slide over
    case byPoints(CGFloat)
}


/// A few stock animations that you can use with Spruce. We want to make it really easy for you to include animations so we tried to include the basics. Use these stock animations to `slide`, `fade`, `spin`, `expand`, or `contract` your views.
public enum StockAnimation {
    /// Have your view slide to where it currently is. Provide a `SlideDirection` and `Size` to determine what the animation should look like.
    case slide(SlideDirection, Distance)
    
    /// Fade the view in
    case fadeIn
    
    /// Spin the view in the direction of the size. Provide a `Size` to define how much the view should spin
    case spin(Angle)
    
    /// Have the view grow in size. Provide a `Size` to define by which scale the view should grow
    case expand(Scale)
    
    /// Have the view shrink in size. Provide a `Size` to define by which scale the view should shrink
    case contract(Scale)
    
    /// Provide custom prepare and change functions for the view to animate
    case custom(prepareFunction: PrepareHandler, animateFunction: ChangeFunction)
    
    /// Given the `StockAnimation`, how should Spruce prepare your view for animation. Since we want all of the views to end the animation where they are supposed to be positioned, we have to reverse their animation effect.
    var prepareFunction: PrepareHandler {
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
    
    
    /// Reset any of the transforms on the view so that the view will end up in its original position. If a `custom` animation is used, then that animation `ChangeFunction` is returned.
    var animationFunction: ChangeFunction {
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
                case (.up, .slightly):
                    return CGPoint(x: 0.0, y: 10.0)
                case (.up, .moderately):
                    return CGPoint(x: 0.0, y: 30.0)
                case (.up, .severely):
                    return CGPoint(x: 0.0, y: 50.0)
                case (.up, .byPoints(let value)):
                    return CGPoint(x: 0.0, y: -value)
                case (.down, .slightly):
                    return CGPoint(x: 0.0, y: -10.0)
                case (.down, .moderately):
                    return CGPoint(x: 0.0, y: -30.0)
                case (.down, .severely):
                    return CGPoint(x: 0.0, y: -50.0)
                case (.down, .byPoints(let value)):
                    return CGPoint(x: 0.0, y: -value)
                case (.left, .slightly):
                    return CGPoint(x: 10.0, y: 0.0)
                case (.left, .moderately):
                    return CGPoint(x: 30.0, y: 0.0)
                case (.left, .severely):
                    return CGPoint(x: 50.0, y: 0.0)
                case (.left, .byPoints(let value)):
                    return CGPoint(x:  -value, y: 0.0)
                case (.right, .slightly):
                    return CGPoint(x: -10.0, y: 0.0)
                case (.right, .moderately):
                    return CGPoint(x: -30.0, y: 0.0)
                case (.right, .severely):
                    return CGPoint(x: -50.0, y: 0.0)
                case (.right, .byPoints(let value)):
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
                case .slightly:
                    return CGFloat(M_PI_4)
                case .moderately:
                    return CGFloat(M_PI_2)
                case .severely:
                    return CGFloat(M_PI)
                case .toAngle(let value):
                    return value
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
            case .slightly:
                return 1.1
            case .moderately:
                return 1.3
            case .severely:
                return 1.5
            case .toScale(let value):
                return value
            }
        case .expand(let size):
            switch size {
            case .slightly:
                return 0.9
            case .moderately:
                return 0.7
            case .severely:
                return 0.5
            case .toScale(let value):
                return value
            }
        default:
            return 0.0
        }
    }
}
