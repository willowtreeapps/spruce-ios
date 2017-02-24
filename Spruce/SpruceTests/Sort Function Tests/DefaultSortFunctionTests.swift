//
//  DefaultSortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/21/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class DefaultSortFunctionTests: SortFunctionTests {
    
    func testDefaultSortFunction() {
        let sortFunction = DefaultSortFunction(interObjectDelay: 0.1)
        let timedViews = sortFunction.getTimeOffsets(view: animatableView)
        
        let expected = [0.0,0.1,0.2,0.3,0.4,
                        0.5,0.6,0.7,0.8,0.9,
                        1.0,1.1,1.2,1.3,1.4,
                        1.5,1.6,1.7,1.8,1.9,
                        2.0,2.1,2.2,2.3,2.4]
        compare(timedViews: timedViews, toExpected: expected)
    }

}
