//
//  ViewOperations.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/9/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public extension UIView {
    public func getOcuppiedSubBounds() -> CGRect {
        return CGRect.zero
    }
    
    public func getSubviews(recursive: Bool) -> [UIView] {
        if recursive {
            return UIView.recursiveSubviews(for: self)
        }
        return self.subviews
    }
    
    private static func recursiveSubviews(for view: UIView) -> [UIView] {
        var subviews: [UIView] = []
        
        for subview in view.subviews {
            subviews.append(subview)
            
            let subSubViews = recursiveSubviews(for: subview)
            subviews.append(contentsOf: subSubViews)
        }
        
        return subviews
    }
}
