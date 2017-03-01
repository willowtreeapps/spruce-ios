//
//  WeightSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/1/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

public enum SpruceWeight {
    case light
    case medium
    case heavy
    case custom(Double)
    
    var coefficient: Double {
        get {
            switch self {
            case .light:
                return 0.5
            case .medium:
                return 1.0
            case .heavy:
                return 2.0
            case .custom(let value):
                return max(0.0, value)
            }
        }
    }
}

public protocol WeightSortFunction: SortFunction {
    var horizontalWeight: SpruceWeight { get set }
    var verticalWeight: SpruceWeight { get set }
}
