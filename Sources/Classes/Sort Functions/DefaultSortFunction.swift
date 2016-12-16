//
//  DefaultSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit


open class DefaultSortFunction: SortFunction {
    
    let interObjectDelay: TimeInterval
    
    public init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    open func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        var timedViews: [SpruceTimedView] = []
        var currentTimeOffset: TimeInterval = 0.0
        let subviews = view.getSubviews(recursive: recursive)
        for subView in subviews {
            let timedView = SpruceTimedView(view: subView, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }
        return timedViews
    }
}
