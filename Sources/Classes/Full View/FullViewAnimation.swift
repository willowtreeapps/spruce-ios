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
    
    public func spruceSubViews(withSortFunction sortFunction: SortFunction, prepare: SprucePrepareHandler? = nil, animation: SpruceAnimation, completion: SpruceCompletionHandler? = nil, exclude: [UIView]? = nil, recursive: Bool = false) {
        var timedViews = sortFunction.getTimeOffsets(view: self, recursive: recursive)
        timedViews = timedViews.sorted { (left, right) -> Bool in
            return left.timeOffset < right.timeOffset
        }
        for (index, view) in timedViews.enumerated() {
            if let exclude = exclude, exclude.reduce(false, { $0 || $1 == view.view }) {
                continue
            }


            if let prepare = prepare {
                prepare(view.view)
            }

            animation.animate(delay: view.timeOffset,
                              view: view.view,
                              completion: ((index == timedViews.count - 1) ? completion : nil))
        }
    }
}
