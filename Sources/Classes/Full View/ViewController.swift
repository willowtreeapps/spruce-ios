//
//  ViewController.swift
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

open class ViewController: UIViewController {
    
    /// an array of spruce stock animations that will be used to animate all of the subviews of the `animationView`
    open var animations: [StockAnimation] = []
    
    /// the length of each of the individual subview animations
    open var duration: TimeInterval = 0.3
    
    /// the style of animation that will be apllied to each of the subviews
    open var animationType: Animation
    
    /// the sort function that should be used for choreographing the animations
    open var sortFunction: SortFunction
    
    /// the view that Spruce should be called on. This means that the subviews of this view will animate in.
    open var animationView: UIView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        animationType = StandardAnimation(duration: duration)
        sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// in the `viewDidLoad` method all of the views are prepared for animation
    override open func viewDidLoad() {
        super.viewDidLoad()
        if animations.count > 0 {
            animationView?.spruce.prepare(with: animations)
        }
    }
    
    
    /// a simple overrided method that will call `spruce_up` on the `animationView`. If the `animationView` is not set then nothing will happen. The code should silently fail.
    ///
    /// - Parameter animated: If true, the view was added to the window using an animation.
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView?.spruce.animate(animations, duration: duration, animationType: animationType, sortFunction: sortFunction, prepare: false)
    }
}
