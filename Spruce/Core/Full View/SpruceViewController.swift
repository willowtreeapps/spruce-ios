//
//  SpruceViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class SpruceViewController: UIViewController {
    var animations: [SpruceStandardAnimation] = []
    var duration: TimeInterval = 0.3
    var animationType: SpruceAnimation
    var sortFunction: SortFunction
    
    var animationView: UIView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        animationType = StandardAnimation(duration: duration)
        sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if animations.count > 0 {
            animationView?.hideAllSubviews()
            animationView?.sprucePrepare(withAnimations: animations)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView?.spruceUp(withAnimations: animations, duration: duration, animationType: animationType, sortFunction: sortFunction, prepare: false)
    }
}
