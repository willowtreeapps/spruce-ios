//
//  WeightedContinuousSortFunction.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public enum SpruceWeight {
    case light
    case medium
    case heavy
    case custom(Double)
    
    var coefficient: Double {
        get {
            switch self {
            case .light:
                return 0.5
            case .medium:
                return 1.0
            case .heavy:
                return 2.0
            case .custom(let value):
                return max(0.0, value)
            }
        }
    }
}

open class ContinuousWeightedSortFunction: ContinuousSortFunction {

    let horizontalWeight: SpruceWeight
    let verticalWeight: SpruceWeight

    public init(position: SprucePosition, duration: TimeInterval, horizontalWeight: SpruceWeight = .medium, verticalWeight: SpruceWeight = .medium) {
        self.horizontalWeight = horizontalWeight
        self.verticalWeight = verticalWeight
        super.init(position: position, duration: duration)
    }

    open override func getTimeOffsets(view: UIView, recursiveDepth: Int) -> [SpruceTimedView] {
        let subviews = view.getSubviews(recursiveDepth: recursiveDepth)
        let comparisonPoint = getDistancePoint(view: view, subviews: subviews)

        let distancedViews = subviews.map {
            return (view: $0, horizontalDistance: comparisonPoint.horizontalDistance(to: $0.referencePoint) * horizontalWeight.coefficient, verticalDistance: comparisonPoint.verticalDistance(to: $0.referencePoint) * verticalWeight.coefficient)
        }

        guard let maxHorizontalDistance = distancedViews.max(by: { $0.horizontalDistance < $1.horizontalDistance })?.horizontalDistance, let maxVerticalDistance = distancedViews.max(by: { $0.verticalDistance < $1.verticalDistance })?.verticalDistance, maxHorizontalDistance > 0.0, maxVerticalDistance > 0.0 else {
            return []
        }

        var timedViews: [SpruceTimedView] = []
        var maxTimeOffset: TimeInterval = 0.0
        for view in distancedViews {
            let normalizedHorizontalDistance = view.horizontalDistance / maxHorizontalDistance
            let normalizedVerticalDistance = view.verticalDistance / maxVerticalDistance
            let offset = duration * (normalizedHorizontalDistance * horizontalWeight.coefficient + normalizedVerticalDistance * verticalWeight.coefficient)
            if offset > maxTimeOffset {
                maxTimeOffset = offset
            }
            let timedView = SpruceTimedView(spruceView: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }
        
        for index in 0..<timedViews.count {
            let timeOffset = timedViews[index].timeOffset
            let normalizedTimeOffset = (timeOffset / maxTimeOffset) * duration
            timedViews[index].timeOffset = normalizedTimeOffset
            if reversed {
                timedViews[index].timeOffset = duration - normalizedTimeOffset
            }
        }
        
        return timedViews
    }
}
