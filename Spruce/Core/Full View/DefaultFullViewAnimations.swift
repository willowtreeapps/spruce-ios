//
//  DefaultFullViewAnimations.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/14/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

enum SpruceStandardAnimation {
    case slideUpSmall
    case slideUpMedium
    case slideUpLarge
    
    case slideDownSmall
    case slideDownMedium
    case slideDownLarge
    
    case slideLeftSmall
    case slideLeftMedium
    case slideLeftLarge
    
    case slideRightSmall
    case slideRightMedium
    case slideRightLarge
    
    case fadeIn
    
    case spinSmall
    case spinMedium
    case spinLarge
    
    case expandSmall
    case expandMedium
    case expandLarge
    
    case contractSmall
    case contractMedium
    case contractLarge
    
    func getClearFunction() -> SpruceChangeFunction {
        switch self {
        case .slideUpSmall, .slideUpMedium, .slideUpLarge,
             .slideDownSmall, .slideDownMedium, .slideDownLarge,
             .slideLeftSmall, .slideLeftMedium, .slideLeftLarge,
             .slideRightSmall, .slideRightMedium, .slideRightLarge:
            let offset = getClearSlideOffset()
            return { view in
                let currentTransform = view.transform
                let offsetTransform = CGAffineTransform(translationX: offset.x, y: offset.y)
                view.transform = currentTransform.concatenating(offsetTransform)
            }
        case .fadeIn:
            return { view in
                view.alpha = 0.0
            }
        case .spinSmall, .spinMedium, .spinLarge:
            let angle = getSpinAngle()
            return { view in
                let currentTransform = view.transform
                let spinTransform = CGAffineTransform(rotationAngle: angle)
                view.transform = currentTransform.concatenating(spinTransform)
            }
        case .expandSmall, .expandMedium, .expandLarge,
             .contractSmall, .contractMedium, .contractLarge:
            let scale = getScale()
            return { view in
                let currentTransform = view.transform
                let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
                view.transform = currentTransform.concatenating(scaleTransform)
            }
        }
    }
    
    func getAnimationFunction() -> SpruceChangeFunction {
        switch self {
        case .slideUpSmall, .slideUpMedium, .slideUpLarge,
             .slideDownSmall, .slideDownMedium, .slideDownLarge,
             .slideLeftSmall, .slideLeftMedium, .slideLeftLarge,
             .slideRightSmall, .slideRightMedium, .slideRightLarge:
            return { view in
                view.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            }
        case .fadeIn:
            return { view in
                view.alpha = 1.0
            }
        case .spinSmall, .spinMedium, .spinLarge:
            return { view in
                view.transform = CGAffineTransform(rotationAngle: 0.0)
            }
        case .expandSmall, .expandMedium, .expandLarge,
             .contractSmall, .contractMedium, .contractLarge:
            return { view in
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
    }
    
    func getClearSlideOffset() -> CGPoint {
        switch self {
        case .slideUpSmall:
            return CGPoint(x: 0.0, y: 10.0)
        case .slideUpMedium:
            return CGPoint(x: 0.0, y: 30.0)
        case .slideUpLarge:
            return CGPoint(x: 0.0, y: 50.0)
        case .slideDownSmall:
            return CGPoint(x: 0.0, y: -10.0)
        case .slideDownMedium:
            return CGPoint(x: 0.0, y: -30.0)
        case .slideDownLarge:
            return CGPoint(x: 0.0, y: -50.0)
        case .slideLeftSmall:
            return CGPoint(x: 10.0, y: 0.0)
        case .slideLeftMedium:
            return CGPoint(x: 30.0, y: 0.0)
        case .slideLeftLarge:
            return CGPoint(x: 50.0, y: 0.0)
        case .slideRightSmall:
            return CGPoint(x: -10.0, y: 0.0)
        case .slideRightMedium:
            return CGPoint(x: -30.0, y: 0.0)
        case .slideRightLarge:
            return CGPoint(x: -50.0, y: 0.0)
        default:
            return CGPoint.zero
        }
    }
    
    func getSpinAngle() -> CGFloat {
        switch self {
        case .spinSmall:
            return CGFloat(M_PI_4)
        case .spinMedium:
            return CGFloat(M_PI_2)
        case .spinLarge:
            return CGFloat(M_PI)
        default:
            return 0.0
        }
    }
    
    func getScale() -> CGFloat {
        switch self {
        case .contractSmall:
            return 1.1
        case .contractMedium:
            return 1.3
        case .contractLarge:
            return 1.5
        case .expandSmall:
            return 0.9
        case .expandMedium:
            return 0.7
        case .expandLarge:
            return 0.5
        default:
            return 0.0
        }
    }
}

extension UIView {
    func spruceUp(withAnimations animations: [SpruceStandardAnimation], duration: TimeInterval = 0.3) {
        let animation = StandardAnimation(duration: duration)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animation)
    }
    
    func spruceUp(withAnimations animations: [SpruceStandardAnimation], duration: TimeInterval = 0.3, animationType: SpruceAnimation) {
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        self.spruceUp(withAnimations: animations, duration: duration, animationType: animationType, sortFunction: sortFunction)
    }
    
    func spruceUp(withAnimations animations: [SpruceStandardAnimation], duration: TimeInterval = 0.3, animationType: SpruceAnimation, sortFunction: SortFunction, prepare: Bool = true) {
        
        if prepare {
            self.sprucePrepare(withAnimations: animations)
        }
        
        /* Create the animations */
        var animationType = animationType
        animationType.changeFunction = { view in
            for animation in animations {
                let animationFunc = animation.getAnimationFunction()
                animationFunc(view)
            }
        }
        self.spruceSubViews(withSortFunction: sortFunction, animation: animationType)
    }
    
    func sprucePrepare(withAnimations animations: [SpruceStandardAnimation]) {
        /* Reset the views to prepare for the animations */
        let clearFunction: SpruceChangeFunction = { view in
            for animation in animations {
                let clearFunc = animation.getClearFunction()
                clearFunc(view)
            }
        }
        
        let isFading = animations.contains(.fadeIn)
        
        UIView.performWithoutAnimation {
            for subView in subviews {
                clearFunction(subView)
                if isFading {
                    subView.isHidden = false
                }
            }
        }
    }
    
    func hideAllSubviews() {
        UIView.performWithoutAnimation {
            for subView in subviews {
                subView.isHidden = true
            }
        }
    }
}
