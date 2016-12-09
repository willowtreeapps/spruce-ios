//
//  TestViewController2Setup.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit


extension TestViewController2 {
    func setup() {
        let viewSize = (self.view.bounds.size.width / 7.0)
        
        self.containerView = UIView(frame: CGRect(x: 0.0, y: 30.0, width: view.bounds.size.width, height: viewSize * 7.0))
        self.view.addSubview(self.containerView!)
        for row in 0..<7 {
            for col in 0..<7 {
                let view = UIView(frame: CGRect(x: CGFloat(col) * viewSize, y: CGFloat(row) * viewSize, width: viewSize, height: viewSize))
                view.backgroundColor = .blue
                containerView?.addSubview(view)
            }
        }
    }
}
