//
//  ExampleViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Spruce

class ExampleViewController: UIViewController {
    let animations: [SpruceStandardAnimation]
    var sortFunction: SortFunction?
    var animationView: UIView?
    var timer: Timer?
    
    init(animations: [SpruceStandardAnimation], nibName: String?) {
        self.animations = animations
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(prepareAnimation))
        animationView?.addGestureRecognizer(tapGesture)
    }
    
    func setup() {
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareAnimation()
    }
    
    func prepareAnimation() {
        animationView?.sprucePrepare(withAnimations: animations)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(callAnimation), userInfo: nil, repeats: false)
    }
    
    func callAnimation() {
        guard let sortFunction = sortFunction else {
            return
        }
        let animation = SpringAnimation(duration: 0.7)
        DispatchQueue.main.async {
            self.animationView?.spruceUp(withAnimations: self.animations, animationType: animation, sortFunction: sortFunction)
        }
    }
}
