//
//  TestViewController3.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/30/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class TestViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let button = SpruceButton(frame: CGRect(x: (view.frame.size.width/2.0) - 100.0, y: (view.frame.size.height/2.0) - 50.0, width: 200.0, height: 100.0))
        button.backgroundColor = UIColor.blue
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
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
}
