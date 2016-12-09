//
//  DefaultAnimations.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/30/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

enum SpruceDefaultChangeFunction {
    case grow
    case shrink
    case fade
    case spin
    case custom(changeFunction: SpruceChangeFunction, resetFunction: SpruceChangeFunction)
    
    func getAnimationFunction() -> SpruceChangeFunction {
        switch self {
        case .grow:
            return { view in
                view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }
        case .shrink:
            return { view in
                view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }
        case .fade:
            return { view in
                view.alpha = 0.8;
            }
        case .spin:
            return { view in
                view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            }
        case .custom(let changeFunction, _):
            return changeFunction
        }
    }
    
    func getResetFunction() -> SpruceChangeFunction {
        switch self {
        case .grow, .shrink, .spin:
            return { view in
                view.transform = CGAffineTransform.identity
            }
        case .fade:
            return { view in
                view.alpha = 1.0;
            }
        case .custom(_, let resetFunction):
            return resetFunction
        }
    }
}
