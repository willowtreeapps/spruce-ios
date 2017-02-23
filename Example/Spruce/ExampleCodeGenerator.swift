//
//  ExampleCodeGenerator.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/23/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Spruce

class ExampleCodeGenerator {
    class func generateCode(forSettings settings: SortFunctionTestSettings) -> String {
        return ""
    }
    
    class func formatString(forSortFunction sortFunction: SortFunctions) -> String {
        return ""
    }
    
    class func string(forCorner corner: SpruceCorner) -> String {
        switch corner {
        case .topLeft:
            return ".topLeft"
        case .topRight:
            return ".topRight"
        case .bottomLeft:
            return ".bottomLeft"
        case .bottomRight:
            return ".bottomRight"
        }
    }
    
    class func string(forPosition position: SprucePosition) -> String {
        switch position {
        case .topLeft:
            return ".topLeft"
        case .topMiddle:
            return ".topMiddle"
        case .topRight:
            return ".topRight"
        case .left:
            return ".left"
        case .middle:
            return ".middle"
        case .right:
            return ".right"
        case .bottomLeft:
            return ".bottomLeft"
        case .bottomMiddle:
            return ".bottomMiddle"
        case .bottomRight:
            return ".bottomRight"
        }
    }
    
    class func string(forDirection direction: SpruceDirection) -> String {
        switch direction {
        case .topToBottom:
            return ".topToBottom"
        case .leftToRight:
            return ".leftToRight"
        case .rightToLeft:
            return ".rightToLeft"
        case .bottomToTop:
            return ".bottomToTop"
        }
    }
    
    class func string(forBool bool: Bool) -> String {
        if bool {
            return "true"
        }
        return "false"
    }
}
