//
//  FullViewAnimation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public extension UIView {
    
    // Use this to prepare all of your views for animation. Including hiding them, fading them, translating them, etc...
    public func sprucePrepare(withChangeFunction changeFunction: SpruceChangeFunction) {
        for view in self.subviews {
            changeFunction(view)
        }
    }
    
    public func spruceSubViews(withSortFunction sortFunction: SortFunction, animation: SpruceAnimation, completion: SpruceCompletionHandler? = nil) {
        var timedViews = sortFunction.getTimeOffsets(view: self)
        timedViews = timedViews.sorted { (left, right) -> Bool in
            return left.timeOffset < right.timeOffset
        }
        for index in 0..<timedViews.count {
            let view = timedViews[index]
            animation.animate(delay: view.timeOffset,
                              view: view.view,
                              completion: ((index == timedViews.count - 1) ? completion : nil))
        }
    }
}
