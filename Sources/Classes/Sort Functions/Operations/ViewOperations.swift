//
//  ViewOperations.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/9/16.
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

public let UnlimitedRecursiveDepth = -1

public extension UIView {
    public func getOcuppiedSubBounds() -> CGRect {
        return CGRect.zero
    }
    
    public func getSubviews(recursiveDepth: Int) -> [UIView] {
        guard recursiveDepth > 0 || recursiveDepth == UnlimitedRecursiveDepth else {
            return self.subviews
        }
        return UIView.recursiveSubviews(for: self, currentDepth: 0, maxDepth: recursiveDepth)
    }
    
    private static func recursiveSubviews(for view: UIView, currentDepth: Int, maxDepth: Int) -> [UIView] {
        guard currentDepth <= maxDepth || maxDepth == UnlimitedRecursiveDepth else {
            return []
        }
        
        var subviews: [UIView] = []
        
        for subview in view.subviews {
            subviews.append(subview)
            
            let subSubViews = recursiveSubviews(for: subview, currentDepth: currentDepth + 1, maxDepth: maxDepth)
            subviews.append(contentsOf: subSubViews)
        }
        
        return subviews
    }
}
