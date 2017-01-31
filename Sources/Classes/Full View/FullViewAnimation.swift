//
//  FullViewAnimation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
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

public extension UIView {
    
    // Use this to prepare all of your views for animation. Including hiding them, fading them, translating them, etc...
    public func sprucePrepare(withChangeFunction changeFunction: SpruceChangeFunction) {
        for view in self.subviews {
            changeFunction(view)
        }
    }
    
    public func spruceSubViews(withSortFunction sortFunction: SortFunction, prepare: SprucePrepareHandler? = nil, animation: SpruceAnimation, completion: SpruceCompletionHandler? = nil, exclude: [UIView]? = nil, recursive: Bool = false) {
        var timedViews = sortFunction.getTimeOffsets(view: self, recursive: recursive)
        timedViews = timedViews.sorted { (left, right) -> Bool in
            return left.timeOffset < right.timeOffset
        }
        for (index, view) in timedViews.enumerated() {
            if let exclude = exclude, exclude.reduce(false, { $0 || $1 == view.view }) {
                continue
            }


            if let prepare = prepare {
                prepare(view.view)
            }

            animation.animate(delay: view.timeOffset,
                              view: view.view,
                              completion: ((index == timedViews.count - 1) ? completion : nil))
        }
    }
}
