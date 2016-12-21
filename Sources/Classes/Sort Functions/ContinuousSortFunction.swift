//
//  ContinuousSortFunction.swift
//  Spruce
//
//  Created by Matt Kauper on 12/21/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

open class ContinuousSortFunction: RadialSortFunction {

    let duration: TimeInterval

    public init(position: SprucePosition, duration: TimeInterval) {
        self.duration = duration
        super.init(position: position, interObjectDelay: 0.0)
    }

    open override func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        let comparisonPoint = getDistancePoint(bounds: view.bounds)
        let subviews = view.getSubviews(recursive: recursive)

        let distancedViews = subviews.map {
            return (view: $0, distance: comparisonPoint.euclideanDistance(to: $0.center))
        }

        guard let maxDistance: Double = distancedViews.max(by: { $0.distance < $1.distance })?.distance , maxDistance > 0 else {
            return []
        }

        var timedViews: [SpruceTimedView] = []
        for view in distancedViews {
            let normalizedDistance = view.distance / maxDistance
            let offset = duration * normalizedDistance
            let timedView = SpruceTimedView(view: view.view, timeOffset: offset)
            timedViews.append(timedView)
        }

        return timedViews
    }
}
