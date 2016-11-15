//
//  FullViewAnimation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

extension UIView {
    func spruceSubViews(withSortFunction sortFunction: SortFunction, animation: SpruceAnimation) {
        let timedViews = sortFunction.getTimeOffsets(view: self)
        for view in timedViews {
            animation.animate(delay: view.timeOffset, view: view.view)
        }
    }
}
