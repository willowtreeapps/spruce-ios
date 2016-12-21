//
//  WeightedContinuousSortFunction.swift
//  Spruce
//
//  Created by Matt Kauper on 12/21/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

open class ContinuousWeightedSortFunction: RadialSortFunction {

    let duration: TimeInterval
    let horizontalWeight: Double
    let verticalWeight: Double

    public init(position: SprucePosition, duration: TimeInterval, horizontalWeight: Double = 1.0, verticalWeight: Double = 1.0) {
        self.duration = duration
        self.horizontalWeight = horizontalWeight
        self.verticalWeight = verticalWeight
        super.init(position: position, interObjectDelay: 0.0)
    }

    open override func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.getSubviews(recursive: recursive)

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
            let offset = duration * (normalizedHorizontalDistance * horizontalWeight + normalizedVerticalDistance * verticalWeight)
            let timedView = SpruceTimedView(view: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
}
