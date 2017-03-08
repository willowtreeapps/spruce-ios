//
//  ExampleViewController.swift
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
import Spruce

class ExampleViewController: UIViewController {
    let animations: [StockAnimation]
    var sortFunction: SortFunction?
    var animationView: UIView?
    var timer: Timer?
    
    init(animations: [StockAnimation], nibName: String?) {
        self.animations = animations
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(prepareAnimation))
        animationView?.addGestureRecognizer(tapGesture)
    }
    
    func setup() {
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareAnimation()
    }
    
    func prepareAnimation() {
        animationView?.spruce_prepare(withAnimations: animations)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(callAnimation), userInfo: nil, repeats: false)
    }
    
    func callAnimation() {
        guard let sortFunction = sortFunction else {
            return
        }
        let animation = SpringAnimation(duration: 0.7)
        DispatchQueue.main.async {
            self.animationView?.spruce_up(withAnimations: self.animations, animationType: animation, sortFunction: sortFunction)
        }
    }
}
