//
//  NoDelaySortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/16/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class NoDelaySortFunction: SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        return view.subviews.flatMap { subView in
            let timedView = SpruceTimedView(view: subView, timeOffset: 0.0)
            return timedView
        }
    }
}
