//
//  Animation.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

public typealias SpruceChangeFunction = (_ view: UIView) -> Void
public typealias SpruceCompletionHandler = (_ finished: Bool) -> Void
public typealias SprucePrepareHandler = (_ view: UIView) -> Void

public protocol SpruceAnimation {
    func animate(delay: TimeInterval, view: UIView, completion:SpruceCompletionHandler?)
    
    var changeFunction: SpruceChangeFunction? { get set }
}
