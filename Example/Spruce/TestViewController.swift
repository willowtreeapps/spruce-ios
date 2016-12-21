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

    var squaresPerRow: Int = 13

    var containerView: UIView?
    
    var corner: SpruceCorner = .bottomRight

    var excludeViews = [UIView]()

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
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation, completion: { finished in
            print("Finished the animation")
        }, exclude: excludeViews)
    }
}

extension TestViewController {
    func setup() {
        let viewSize = (self.view.bounds.size.width / CGFloat(squaresPerRow))

        self.containerView = UIView(frame: CGRect(x: 0.0, y: 30.0, width: view.bounds.size.width, height: viewSize * CGFloat(squaresPerRow)))
        self.view.addSubview(self.containerView!)
        for row in 0..<squaresPerRow {
            for col in 0..<squaresPerRow {
                let view = UIView(frame: CGRect(x: CGFloat(col) * viewSize, y: CGFloat(row) * viewSize, width: viewSize, height: viewSize))
                view.backgroundColor = .blue
                view.alpha = 0.0
                view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                containerView?.addSubview(view)

                if col == 3 || row == 3{
                    excludeViews.append(view)
                }
            }
        }
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
        let sortFunction = LinearSortFunction(direction: direction, interObjectDelay: 0.05)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)

    }
}

class TestInlineViewController: TestViewController {
    override func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = InlineSortFunction(corner: .topLeft, interObjectDelay: 0.05)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
}

class TestWeightedContinuousViewController: TestViewController {
    override func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = ContinuousWeightedSortFunction(position: .topLeft, duration: 1.0, horizontalWeight: .heavy, verticalWeight: .light)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
}


class TestWeightedContinuousViewController2: TestViewController {
    override func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = ContinuousWeightedSortFunction(position: .middle, duration: 1.0, horizontalWeight: .light, verticalWeight: .heavy)
        containerView?.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
}
