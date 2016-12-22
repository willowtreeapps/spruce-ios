//
//  TestViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit
import Spruce

class CustomAnimationViewController: UIViewController {

    var squaresPerRow: Int = 13

    var containerView: UIView?
    
    var corner: SpruceCorner = .bottomRight

    var excludeViews = [UIView]()

    var customAnimation: (()->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let customAnimation = self.customAnimation {
            Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { _ in
                customAnimation()
            }
        }
    }
}

extension CustomAnimationViewController {
    func setup() {
        let spacing: CGFloat = 3.0
        let frameWidth = view.bounds.size.width - (spacing * CGFloat(squaresPerRow - 1))
        let viewSize = (frameWidth / CGFloat(squaresPerRow))

        self.containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: viewSize * CGFloat(squaresPerRow)))
        self.view.addSubview(self.containerView!)
        for row in 0..<squaresPerRow {
            for col in 0..<squaresPerRow {
                let view = UIView(frame: CGRect(x: CGFloat(col) * (viewSize + spacing), y: CGFloat(row) * (viewSize + spacing), width: viewSize, height: viewSize))
                view.backgroundColor = UIColor.spruceGreen
                view.layer.cornerRadius = 2.0
                view.clipsToBounds = true
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
