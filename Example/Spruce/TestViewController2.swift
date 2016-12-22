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

    var squaresPerRow: Int = 11

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
        let spacing: CGFloat = 3.0
        let frameWidth = view.bounds.size.width - (spacing * CGFloat(squaresPerRow + 1))
        let viewSize = (frameWidth / CGFloat(squaresPerRow))

        self.containerView = UIView(frame: CGRect(x: spacing, y: 67.0,
                                                  width: view.bounds.size.width - (spacing * 2.0),
                                                  height: viewSize * CGFloat(squaresPerRow)))
        self.view.addSubview(self.containerView!)
        for row in 0..<squaresPerRow {
            for col in 0..<squaresPerRow {
                let view = UIView(frame: CGRect(x: CGFloat(col) * (viewSize + spacing), y: CGFloat(row) * (viewSize + spacing), width: viewSize, height: viewSize))
                view.backgroundColor = UIColor.spruceGreen
                view.layer.cornerRadius = 2.0
                view.clipsToBounds = true
                containerView?.addSubview(view)
            }
        }
    }
}
