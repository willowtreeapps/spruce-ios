//
//  NoDelaySortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/7/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class NoDelaySortFunctionTests: SortFunctionTests {
    
    func testNoDelaySortFunction() {
        let sortFunction = NoDelaySortFunction()
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0,
                        0.0,0.0,0.0,0.0,0.0]
        compare(timedViews: timedViews, toExpected: expected)
    }
}
