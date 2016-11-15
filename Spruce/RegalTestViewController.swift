//
//  RegalTestViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class RegalTestViewController: UIViewController {
    class func build() -> RegalTestViewController {
        return RegalTestViewController(nibName: "RegalTestViewController", bundle: nil)
    }
    
    @IBAction func animated() {
        let errorScreen = REGFullPageErrorScreen.build(animated: true)
        errorScreen.modalPresentationStyle = .overCurrentContext
        errorScreen.modalTransitionStyle = .crossDissolve
        present(errorScreen, animated: true, completion: nil)
    }
    
    @IBAction func notAnimated() {
        let errorScreen = REGFullPageErrorScreen.build(animated: false)
        errorScreen.modalPresentationStyle = .overCurrentContext
        errorScreen.modalTransitionStyle = .crossDissolve
        present(errorScreen, animated: true, completion: nil)
    }
}
