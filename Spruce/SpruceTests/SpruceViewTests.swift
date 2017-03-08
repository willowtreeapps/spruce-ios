//
//  SpruceViewTests.swift
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
import UIKit

class SpruceViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRecursiveOneSubview() {
        let parentView = UIView()
        let subview = UIView()
        parentView.addSubview(subview)
        
        var subviews = parentView.subviews(withRecursiveDepth: 1)
        
        XCTAssertEqual(subviews.count, 1)
        
        subviews = parentView.subviews(withRecursiveDepth: 5)
        XCTAssertEqual(subviews.count, 1)
        
        subviews = parentView.subviews(withRecursiveDepth: .spruceUnlimited)
        XCTAssertEqual(subviews.count, 1)
    }
    
    func testRecursiveZeroSubviews() {
        let parentView = UIView()
        
        var subviews = parentView.subviews(withRecursiveDepth: 1)
        
        XCTAssertEqual(subviews.count, 0)
        
        subviews = parentView.subviews(withRecursiveDepth: 5)
        XCTAssertEqual(subviews.count, 0)
        
        subviews = parentView.subviews(withRecursiveDepth: .spruceUnlimited)
        XCTAssertEqual(subviews.count, 0)
    }
    
    func testRecursiveMultipleSubviews() {
        let parentView = UIView()
        for _ in 0..<5 {
            let subview = UIView()
            parentView.addSubview(subview)
        }
        
        var subviews = parentView.subviews(withRecursiveDepth: 0)
        
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.subviews(withRecursiveDepth: 5)
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.subviews(withRecursiveDepth: .spruceUnlimited)
        XCTAssertEqual(subviews.count, 5)
    }
    
    func testRecursiveMultipleNestedSubviews() {
        let parentView = UIView()
        for _ in 0..<5 {
            let subview = UIView()
            parentView.addSubview(subview)
            
            for _ in 0..<2 {
                let subsubview = UIView()
                subview.addSubview(subsubview)
                
                for _ in 0..<1 {
                    let subsubsubview = UIView()
                    subsubview.addSubview(subsubsubview)
                }
            }
        }
        
        var subviews = parentView.subviews(withRecursiveDepth: 0)
        
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.subviews(withRecursiveDepth: 1)
        XCTAssertEqual(subviews.count, 15)
        
        subviews = parentView.subviews(withRecursiveDepth: 2)
        XCTAssertEqual(subviews.count, 25)
        
        subviews = parentView.subviews(withRecursiveDepth: 5)
        XCTAssertEqual(subviews.count, 25)
        
        subviews = parentView.subviews(withRecursiveDepth: .spruceUnlimited)
        XCTAssertEqual(subviews.count, 25)
    }
    
    func testRecursiveCoordinateSpaceRemapping() {
        let parentView = UIView(frame: CGRect(x: 10.0, y: 10.0, width: 100.0, height: 100.0))
        let subview1 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 40.0, height: 40.0)))
        let subview2 = UIView(frame: CGRect(x: 10.0, y: 10.0, width: 10.0, height: 10.0))
        let subview3 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10.0, height: 10.0)))
        
        parentView.addSubview(subview1)
        subview1.addSubview(subview2)
        subview2.addSubview(subview3)
        
        let subviews = parentView.subviews(withRecursiveDepth: .spruceUnlimited)
        
        XCTAssertEqual(subviews.count, 3)
        
        XCTAssertEqual(CGPoint(x: 20.0, y: 20.0), subviews[0].referencePoint)
        XCTAssertEqual(CGPoint(x: 15.0, y: 15.0), subviews[1].referencePoint)
        XCTAssertEqual(CGPoint(x: 15.0, y: 15.0), subviews[2].referencePoint)
    }
}
