//
//  SortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

struct SpruceTimedView {
    let view: UIView
    let timeOffset: TimeInterval
}

protocol SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView]
}
