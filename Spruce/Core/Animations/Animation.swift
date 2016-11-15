//
//  Animation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

typealias SpruceChangeFunction = (_ view: UIView) -> Void

protocol SpruceAnimation {
    func animate(delay: TimeInterval, view: UIView)
    
    var changeFunction: SpruceChangeFunction? { get set }
}
