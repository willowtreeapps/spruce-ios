//
//  SortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public struct SpruceTimedView {
    let view: UIView
    let timeOffset: TimeInterval
}

public protocol SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView]
    func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView]
}

public extension SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        return getTimeOffsets(view: view, recursive: false)
    }
}
