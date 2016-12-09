//
//  SpruceButton.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/30/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class SpruceButton: UIButton {
    
    var changeFunction: SpruceDefaultChangeFunction = .grow
    var animation: SpruceAnimation = StandardAnimation(duration: 0.2)
    
    override var isHighlighted: Bool {
        didSet {
            let function: SpruceChangeFunction
            if isHighlighted {
                function = changeFunction.getAnimationFunction()
            }
            else {
                function = changeFunction.getResetFunction()
            }
            animation.changeFunction = function
            animation.animate(delay: 0.0, view: self)
        }
    }
}
