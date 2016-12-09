//
//  TestViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit
import Spruce

class TestViewController: UIViewController {
    
    var containerView: UIView?
    
    var corner: SpruceCorner = .bottomRight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.callAnimation()
        }
    }
    
    func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = CorneredSortFunction(corner: corner, interObjectDelay: 0.05)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
}


class TestRadialViewController: TestViewController {
    var reversed: Bool = false
    override func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = RadialSortFunction(position: .topMiddle, interObjectDelay: 0.05)
        sortFunction.reversed = reversed
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
}

class TestLinearViewController: TestViewController {
    var direction: SpruceDirection = .topToBottom
    override func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)

    }
}
