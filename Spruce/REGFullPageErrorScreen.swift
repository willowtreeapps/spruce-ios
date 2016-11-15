//
//  REGFullPageErrorScreen.swift
//  Regal
//
//  Created by Jackson Taylor on 7/19/16.
//  Copyright © 2016 Regal Cinemas, Inc. All rights reserved.
//

import UIKit

typealias REGErrorActionCallback = (() -> Void)

class REGFullPageErrorScreen: SpruceViewController {
    
    @IBOutlet weak var centerView: UIView!
    
    class func build(animated: Bool) -> REGFullPageErrorScreen {
        let errorScreen = REGFullPageErrorScreen(nibName: "REGFullPageErrorScreen", bundle: nil)
        errorScreen.animations = animated ? [.fadeIn, .slide(.up, .large), .expand(.small)] : []
        errorScreen.duration = 0.5
//        errorScreen.animationType = SpringAnimation(duration: 0.33)
        return errorScreen
    }
    
    override func viewDidLoad() {
        animationView = centerView
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
