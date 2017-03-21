//
//  SortFunctionTests.swift
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


import XCTest
@testable import Spruce

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
    
    func compare(timedViews: [Double], toExpected expected: [TimeInterval]) {
        XCTAssertEqual(timedViews.count, expected.count)
        
        guard timedViews.count == expected.count else {
            XCTFail("TimedViews not equal to expected")
            return
        }
        
        for timedView in timedViews {
            guard let index = timedView.spruceView.view?.tag else {
                XCTFail("Failed to find UIView Object")
                continue
            }
            let expectedDelay = expected[index]
            XCTAssertEqualWithAccuracy(timedView.timeOffset, expectedDelay, accuracy: 0.000001)
        }
    }
    
    func printTimedViews(_ timedViews: [Double]) {
        let timedViews = timedViews.sorted { (left, right) -> Bool in
            guard let leftTag = left.spruceView.view?.tag,
                let rightTag = right.spruceView.view?.tag else {
                XCTFail("Failed to find UIView Object")
                return false
            }
            return leftTag < rightTag
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
