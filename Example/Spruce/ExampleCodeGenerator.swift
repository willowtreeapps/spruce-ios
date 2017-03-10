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
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forDouble: settings.delay, decimals: 3))
        case .linear:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forDirection: settings.direction),
                                        string(forDouble: settings.delay, decimals: 3))
        case .cornered, .inline:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forCorner: settings.corner),
                                        string(forDouble: settings.delay, decimals: 3))
        case .radial:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        string(forDouble: settings.delay, decimals: 3))
        case .continuous:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        string(forDouble: settings.duration))
        case .weightedContinuous:
            sortFunctionString = String(format: sortFunctionFormatString,
                                        string(forPosition: settings.position),
                                        string(forDouble: settings.duration),
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
            return "DefaultSortFunction(interObjectDelay: %@)"
        case .linear:
            return "LinearSortFunction(direction: %@, interObjectDelay: %@)"
        case .cornered:
            return "CorneredSortFunction(corner: %@, interObjectDelay: %@)"
        case .radial:
            return "RadialSortFunction(position: %@, interObjectDelay: %@)"
        case .inline:
            return "InlineSortFunction(corner: %@, interObjectDelay: %@)"
        case .continuous:
            return "ContinuousSortFunction(position: %@, duration: %@)"
        case .weightedContinuous:
            return "ContinuousWeightedSortFunction(position: %@, duration: %@, horizontalWeight: %@, verticalWeight: %@)"
        case .random:
            return "RandomSortFunction(interObjectDelay: %@)"
        }
    }
    
    class func string(forCorner corner: Corner) -> String {
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
    
    class func string(forPosition position: Position) -> String {
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
    
    class func string(forDirection direction: Direction) -> String {
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
    
    class func string(forWeight weight: Weight) -> String {
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
    
    class func string(forDouble double: Double, decimals: Int = 2) -> String {
        let format = "%.\(decimals)f"
        return String(format: format, double)
    }
}
