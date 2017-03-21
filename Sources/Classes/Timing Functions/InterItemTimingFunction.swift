//
//  InterItemTimingFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/20/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

public struct InterItemTimingFunction: TimingFunction {
    var interObjectDelay: TimeInterval = 0.1
    
    public init() {
        
    }
    
    public init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    public func timeOffsets(forViews views: [WeightedView]) -> [TimedView] {
        let views = views.sorted()
        guard var lastWeight = views.first?.weight else {
            return []
        }
        var currentTimeOffset = 0.0
        var timedViews: [TimedView] = []
        for view in views {
            if floor(lastWeight) != floor(view.weight) {
                lastWeight = view.weight
                currentTimeOffset += interObjectDelay
            }
            let timedView = TimedView(spruceView: view.spruceView, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
}
