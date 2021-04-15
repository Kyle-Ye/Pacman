//
//  FontTests.swift
//  PacmanTests
//
//  Created by Kyle on 2021/4/15.
//

@testable import Pacman
import XCTest
import AppKit

class FontTests: XCTestCase {
    override func setUp() {
        print("Font Test Begin")
    }
    
    override func tearDown() {
        print("Font Test End")
    }
    
    func testArcadeFont(){
        let font = NSFont(name: "Arcade Rounded", size: 25)
        XCTAssertNotNil(font)
    }
}
