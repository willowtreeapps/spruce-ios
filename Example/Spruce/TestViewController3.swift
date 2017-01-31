//
//  TestViewController3.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/30/16.
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

class TestViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let button = SpruceButton(frame: CGRect(x: (view.frame.size.width/2.0) - 100.0, y: (view.frame.size.height/2.0) - 50.0, width: 200.0, height: 100.0))
        button.backgroundColor = UIColor.spruceGreen
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
}

class SpruceButtonBounceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let button = SpruceButton(frame: CGRect(x: (view.frame.size.width/2.0) - 100.0, y: (view.frame.size.height/2.0) - 50.0, width: 200.0, height: 100.0))
        button.animation = SpringAnimation(duration: 0.3)
        button.backgroundColor = UIColor.spruceGreen
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
}
