//
//  Spruce.swift
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


/// Access to all of the Spruce library animations. Use this to call functions such as `.animate` or `.prepare`
public struct Spruce {
    
    /// Internal housing of a `UIView` so that we do not conflict with namespaces
    internal let view: UIView
    
    internal init(view: UIView) {
        self.view = view
    }
}

/// Used to keep track of the `UIView` object and a changing reference point. Since Spruce allows for
/// recursive subview lookup, we need to handle changing the coordinate space. Once the coordinate space
/// has been accounted for we can then alter the reference point.
public protocol View {
    
    /// The view that should be animating
    weak var view: UIView? { get }
    
    /// The adjusted for reference point.
    var referencePoint: CGPoint { get set }
}

public struct SpruceUIView: View {
    public private(set) weak var view: UIView?
    public var referencePoint: CGPoint
    
    public init(view: UIView, referencePoint: CGPoint) {
        self.view = view
        self.referencePoint = referencePoint
    }
}
