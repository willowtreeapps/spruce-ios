//
//  TestViewController2.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class TestViewController2: UIViewController {
    
    var containerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setup()
        
        containerView?.hideAllSubviews()
    }
    
    /* Where all the magic happens */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        containerView?.spruceUp(withAnimations: [.fadeIn, .expand(.medium), .spin(.large), .slide(.up,.medium)])
    }
}
