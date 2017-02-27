//
//  ExampleCodeGenerator.swift
//  Spruce
//
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Spruce

class ExampleCodeGenerator {
    class func generateCode(forSettings settings: SortFunctionTestSettings) -> String {
        let sortFunctionFormatString = formatString(forSortFunction: settings.function)
        let sortFunctionString: String
        switch settings.function {
        case .base, .random:
            sortFunctionString = String(format: sortFunctionFormatString, settings.delay)
        case .linear:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forDirection: settings.direction),
                                        settings.delay)
        case .cornered, .inline:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forCorner: settings.corner),
                                        settings.delay)
        case .radial:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        settings.delay)
        case .continuous:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        settings.duration)
        case .weightedContinuous:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        settings.duration,
                                        string(forWeight: settings.horizontalWeight),
                                        string(forWeight: settings.verticalWeight))
        }
        
        var codeString = "let sortFunction = \(sortFunctionString)"
        
        switch settings.function {
        case .base, .random:
            break
        default:
            guard settings.reverse else {
                break
            }
            codeString += "\nsortFunction.reversed = true"
        }
        
        return codeString
    }
    
    class func formatString(forSortFunction sortFunction: SortFunctions) -> String {
        switch sortFunction {
        case .base:
            return "DefaultSortFunction(interObjectDelay: %.2f)"
        case .linear:
            return "LinearSortFunction(direction: %@, interObjectDelay: %.2f)"
        case .cornered:
            return "CorneredSortFunction(corner: %@, interObjectDelay: %.2f)"
        case .radial:
            return "RadialSortFunction(position: %@, interObjectDelay: %.2f)"
        case .inline:
            return "InlineSortFunction(corner: %@, interObjectDelay: %.2f)"
        case .continuous:
            return "ContinuousSortFunction(position: %@, duration: %.2f)"
        case .weightedContinuous:
            return "ContinuousWeightedSortFunction(position: %@, duration: %.2f, horizontalWeight: %@, verticalWeight: %@)"
        case .random:
            return "RandomSortFunction(interObjectDelay: %.2f)"
        }
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
    
    class func string(forWeight weight: SpruceWeight) -> String {
        switch weight {
        case .light:
            return ".light"
        case .medium:
            return ".medium"
        case .heavy:
            return ".heavy"
        case .custom(let value):
            return ".custom(\(value))"
        }
    }
    
    class func string(forBool bool: Bool) -> String {
        if bool {
            return "true"
        }
        return "false"
    }
}
