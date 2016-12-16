//
//  NoDelaySortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/16/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

open class NoDelaySortFunction: SortFunction {
    open func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        let subviews = view.getSubviews(recursive: recursive)
        return subviews.flatMap { subView in
            let timedView = SpruceTimedView(view: subView, timeOffset: 0.0)
            return timedView
        }
    }
}
