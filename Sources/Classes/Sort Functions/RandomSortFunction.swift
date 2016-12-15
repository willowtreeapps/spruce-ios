//
//  RandomSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

open class RandomSortFunction: SortFunction {
    
    let interObjectDelay: TimeInterval
    
    public init(interObjectDelay: TimeInterval) {
        self.interObjectDelay = interObjectDelay
    }
    
    open func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView] {
        var subViews = view.getSubviews(recursive: recursive)
        subViews.shuffle()
        
        var timedViews: [SpruceTimedView] = []
        var currentTimeOffset: TimeInterval = 0.0
        for subView in subViews {
            let timedView = SpruceTimedView(view: subView, timeOffset: currentTimeOffset)
            timedViews.append(timedView)
            currentTimeOffset += interObjectDelay
        }
        return timedViews
    }
}

// Array Shuffle:
// http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (unshuffledCount, firstUnshuffled) in zip(stride(from: c, to: 1, by: -1), indices) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}
