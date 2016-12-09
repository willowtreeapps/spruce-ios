//
//  SpringAnimation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit


open class SpringAnimation: SpruceAnimation {
    
    public var changeFunction: SpruceChangeFunction?
    let duration: TimeInterval
    let damping: CGFloat = 0.5
    let initialVelocity: CGFloat = 0.7
    
    public init(duration: TimeInterval) {
        self.duration = duration
    }
    
    public convenience init(duration: TimeInterval, changes: @escaping SpruceChangeFunction) {
        self.init(duration: duration)
        self.changeFunction = changes
    }
    
    open func animate(delay: TimeInterval, view: UIView) {
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: initialVelocity, options: [], animations: { [weak self] in
            self?.changeFunction?(view)
        }, completion: nil)
    }
}
