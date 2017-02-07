//
//  WeightedContinuousSortFunction.swift
//  Spruce
//
//  Created by Matt Kauper on 12/21/16.
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

import Foundation

public enum SpruceWeight {
    case light
    case medium
    case heavy
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
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.getSubviews(recursiveDepth: recursiveDepth)

        let distancedViews = subviews.map {
            return (view: $0, horizontalDistance: comparisonPoint.horizontalDistance(to: $0.center), verticalDistance: comparisonPoint.verticalDistance(to: $0.center))
        }

        guard let maxHorizontalDistance = distancedViews.max(by: { $0.horizontalDistance < $1.horizontalDistance })?.horizontalDistance, let maxVerticalDistance = distancedViews.max(by: { $0.verticalDistance < $1.verticalDistance })?.verticalDistance, maxHorizontalDistance > 0.0, maxVerticalDistance > 0.0 else {
            return []
        }

        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            let normalizedHorizontalDistance = view.horizontalDistance / maxHorizontalDistance
            let normalizedVerticalDistance = view.verticalDistance / maxVerticalDistance
            let offset = duration * (normalizedHorizontalDistance * getWeightCoefficient(for: horizontalWeight) + normalizedVerticalDistance * getWeightCoefficient(for: verticalWeight))
            let timedView = SpruceTimedView(view: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }

    private func getWeightCoefficient(for weight: SpruceWeight) -> Double {
        switch weight {
        case .light:
            return 0.5
        case .medium:
            return 1.0
        case .heavy:
            return 2.0
        }
    }
}
