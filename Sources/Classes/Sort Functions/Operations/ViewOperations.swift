//
//  ViewOperations.swift
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

public extension Spruce {
    
    
    /// The receiver's immediate subviews given the recursive depth. If a subview contains other subviews, they will be listed in the array following their parent view. Consider the following example:
    /// ```
    /// // A: [B, C]
    /// // B: [D, E]
    /// // C: []
    /// // D: []
    /// // E: []
    /// let result = A.spruce.subviews(withRecursiveDepth: 1)
    /// // result: [A, B, D, E, C]
    /// ```
    ///
    /// - Parameter recursiveDepth: an int for how deep into the view hierarchy the subview search should go
    /// - Returns: an array of all the subviews in the receiver view. Depending on the `recursiveDepth` this could contain the subviews of subviews also.
    /// - Note: This method will return an array of `View`. These are used so that when we adjust for coordinate space differences, it does not affect the way your screen renders. A `View` is a simple struct with `view: UIView` and `referencePoint: CGPoint` variables.
    /// - Precondition: `recursiveDepth` is an Int >= 0  (0...Int.max).
    public func subviews(withRecursiveDepth recursiveDepth: Int) -> [View] {
        let subviews: [UIView]
        
        // Handle special cases for UITableView and UICollectionView
        switch self.view {
        case let tableView as UITableView:
            subviews = tableView.visibleCells
        case let collectionView as UICollectionView:
            subviews = collectionView.visibleCells
        default:
            subviews = self.view.subviews
        }
        
        guard recursiveDepth > 0 || recursiveDepth == .max else {
            return subviews.map {
                SpruceUIView(view: $0, referencePoint: $0.center)
            }
        }
        return Spruce.recursiveSubviews(for: self.view, maxDepth: recursiveDepth, coordinateView: self.view)
    }
    
    /// Search the view hierarchy recursively looking for all the subviews of subviews
    ///
    /// - Parameters:
    ///   - view: the main view to look for subviews of
    ///   - maxDepth: an int representing how far in the view hierarchy the recursive search should go
    ///   - coordinateView: the main view from which all subviews should have their coordinate spaces mapped to
    /// - Returns: an array of `View` where each subview will have their coordinate space referencing the `coordinateView`.
    /// - Note: This is a recursive method and could cause memory exceptions if your view hierarchy is too large. Keep in mind that this is rare, but a possiblility. If you run into an issue with this change the depth of your search.
    /// - Precondition: `maxDepth` is an Int >= 0  (0...Int.max)
    private static func recursiveSubviews(for view: UIView, maxDepth: Int, coordinateView: UIView) -> [View] {
        guard maxDepth >= 0 || maxDepth == .max else {
            return []
        }
        
        var subviews: [View] = []
        
        for subview in view.subviews {
            let referencePoint: CGPoint
            if let superview = subview.superview {
                referencePoint = superview.convert(subview.center, to: coordinateView)
            }
            else {
                referencePoint = subview.center
            }
            subviews.append(SpruceUIView(view: subview, referencePoint: referencePoint))
            
            let subSubViews = Spruce.recursiveSubviews(for: subview, maxDepth: maxDepth - 1, coordinateView: coordinateView)
            subviews.append(contentsOf: subSubViews)
        }
        
        return subviews
    }
}
