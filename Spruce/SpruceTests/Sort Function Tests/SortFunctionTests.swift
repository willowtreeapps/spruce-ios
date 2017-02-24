//
//  SortFunctionTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/7/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
//

import XCTest

class SortFunctionTests: XCTestCase {
    
    var animatableView: UIView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 500.0, height: 500.0)))
    let squaresPerRow = 5
    
    func addTestViews() {
        let spacing: CGFloat = 0.0
        let frameWidth = animatableView.bounds.size.width - (spacing * CGFloat(squaresPerRow - 1))
        let viewSize = (frameWidth / CGFloat(squaresPerRow))
        
        var tag = 0
        for row in 0..<squaresPerRow {
            for col in 0..<squaresPerRow {
                let view = UIView(frame: CGRect(x: CGFloat(col) * (viewSize + spacing), y: CGFloat(row) * (viewSize + spacing), width: viewSize, height: viewSize))
                view.tag = tag
                animatableView.addSubview(view)
                tag += 1
            }
        }
    }
    
    override func setUp() {
        super.setUp()
        
        addTestViews()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        _ = animatableView.subviews.map { $0.removeFromSuperview() }
    }
    
    func testSubviews() {
        XCTAssertEqual(animatableView.subviews.count, squaresPerRow * squaresPerRow)
    }
    
    func compare(timedViews: [SpruceTimedView], toExpected expected: [TimeInterval]) {
        XCTAssertEqual(timedViews.count, expected.count)
        
        guard timedViews.count == expected.count else {
            XCTFail("TimedViews not equal to expected")
            return
        }
        
        for timedView in timedViews {
            let index = timedView.spruceView.view.tag
            let expectedDelay = expected[index]
            XCTAssertEqualWithAccuracy(timedView.timeOffset, expectedDelay, accuracy: 0.000001)
        }
    }
    
    func printTimedViews(_ timedViews: [SpruceTimedView]) {
        let timedViews = timedViews.sorted { (left, right) -> Bool in
            return left.spruceView.view.tag < right.spruceView.view.tag
        }
        print("[", terminator: "")
        for index in 0..<timedViews.count {
            if index == timedViews.count - 1 {
                print("\(timedViews[index].timeOffset)]", terminator: "")
            }
            else {
                print("\(timedViews[index].timeOffset),", terminator: "")
            }
            
            if index % 5 == 4 {
                print("")
            }
        }
    }
}
