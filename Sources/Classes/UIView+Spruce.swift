//
//  UIView+Spruce.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/8/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Access to all of the Spruce library animations. Use this to call functions such as `.animate` or `.prepare`
    public var spruce: Spruce {
        return Spruce(view: self)
    }
    
    public var 🌲: Spruce {
        return spruce
    }
}
