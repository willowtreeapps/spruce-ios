//
//  DurationTimingFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 3/20/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import Foundation

public struct DurationTimingFunction: TimingFunction {
    var duration: TimeInterval = 0.3
    
    public init() {
        
    }
    
    public init(duration: TimeInterval) {
        self.duration = duration
    }
    
    public func timeOffsets(forViews views: [WeightedView]) -> [TimedView] {
        let views = views.sorted()
        guard let maxWeight = views.max()?.weight else {
            return []
        }
        var timedViews: [TimedView] = []
        for view in views {
            let timeOffset = duration * TimeInterval(view.weight / maxWeight)
            let timedView = TimedView(spruceView: view.spruceView, timeOffset: timeOffset)
            timedViews.append(timedView)
        }
        
        return timedViews
    }
}
