//
//  SpruceViewTests.swift
//  Spruce
//
//  Created by Jackson Taylor on 1/26/17.
//  Copyright © 2017 WillowTree Apps, Inc. All rights reserved.
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
        
        var subviews = parentView.getSubviews(recursiveDepth: 1)
        
        XCTAssertEqual(subviews.count, 1)
        
        subviews = parentView.getSubviews(recursiveDepth: 5)
        XCTAssertEqual(subviews.count, 1)
        
        subviews = parentView.getSubviews(recursiveDepth: UnlimitedRecursiveDepth)
        XCTAssertEqual(subviews.count, 1)
    }
    
    func testRecursiveZeroSubviews() {
        let parentView = UIView()
        
        var subviews = parentView.getSubviews(recursiveDepth: 1)
        
        XCTAssertEqual(subviews.count, 0)
        
        subviews = parentView.getSubviews(recursiveDepth: 5)
        XCTAssertEqual(subviews.count, 0)
        
        subviews = parentView.getSubviews(recursiveDepth: UnlimitedRecursiveDepth)
        XCTAssertEqual(subviews.count, 0)
    }
    
    func testRecursiveMultipleSubviews() {
        let parentView = UIView()
        for _ in 0..<5 {
            let subview = UIView()
            parentView.addSubview(subview)
        }
        
        var subviews = parentView.getSubviews(recursiveDepth: 0)
        
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.getSubviews(recursiveDepth: 5)
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.getSubviews(recursiveDepth: UnlimitedRecursiveDepth)
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
        
        var subviews = parentView.getSubviews(recursiveDepth: 0)
        
        XCTAssertEqual(subviews.count, 5)
        
        subviews = parentView.getSubviews(recursiveDepth: 1)
        XCTAssertEqual(subviews.count, 15)
        
        subviews = parentView.getSubviews(recursiveDepth: 2)
        XCTAssertEqual(subviews.count, 25)
        
        subviews = parentView.getSubviews(recursiveDepth: 5)
        XCTAssertEqual(subviews.count, 25)
        
        subviews = parentView.getSubviews(recursiveDepth: UnlimitedRecursiveDepth)
        XCTAssertEqual(subviews.count, 25)
    }
}
