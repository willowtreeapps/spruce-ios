//
//  SortFunction.swift
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

public struct SpruceTimedView {
    let spruceView: SpruceView
    var timeOffset: TimeInterval
}

public protocol SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView]
    /*
     * recursiveDepth -> An integer defining how deep the recursive subview search should go. A value
     *                   of 0 is the same as calling the `subviews` on the actual view itself. Therefore
     *                   a depth of 1 will be getting the subviews of each of the subviews, etc...
     */
    func getTimeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView]
}

public extension SortFunction {
    func getTimeOffsets(view: UIView) -> [SpruceTimedView] {
        return getTimeOffsets(view: view, recursiveDepth: 0)
    }
}
