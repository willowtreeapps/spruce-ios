//
//  DefaultAnimations.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public enum SpruceDefaultChangeFunction {
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
