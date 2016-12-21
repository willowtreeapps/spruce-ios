//
//  TestViewController2.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit
import Spruce

class TestViewController2: UIViewController {

    var squaresPerRow: Int = 7

    var containerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setup()
        
        containerView?.hideAllSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        containerView?.spruceUp(withAnimations: [.fadeIn, .expand(.medium), .spin(.large), .slide(.up,.medium)])
    }
}

extension TestViewController2 {
    func setup() {
        let viewSize = (self.view.bounds.size.width / CGFloat(squaresPerRow))

        self.containerView = UIView(frame: CGRect(x: 0.0, y: 30.0, width: view.bounds.size.width, height: viewSize * CGFloat(squaresPerRow)))
        self.view.addSubview(self.containerView!)
        for row in 0..<squaresPerRow {
            for col in 0..<squaresPerRow {
                let view = UIView(frame: CGRect(x: CGFloat(col) * viewSize, y: CGFloat(row) * viewSize, width: viewSize, height: viewSize))
                view.backgroundColor = .blue
                containerView?.addSubview(view)
            }
        }
    }
}
