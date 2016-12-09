//
//  DefaultSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit


class DefaultSortFunction: SortFunction {
    
    let interObjectDelay: TimeInterval
    
    init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        var timedViews: [SpruceTimedView] = []
        var currentTimeOffset: TimeInterval = 0.0
        for subView in view.subviews {
            let timedView = SpruceTimedView(view: subView, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }
        return timedViews
    }
}
