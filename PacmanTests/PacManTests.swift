//
//  PacmanTests.swift
//  PacmanTests
//
//  Created by Kyle on 2021/4/7.
//

import XCTest
@testable import Pacman

class PacManTests: XCTestCase {
    var pacman: PacMan!
    
    override func setUp() {
        pacman = PacMan(name: "test")
    }
    
    override func tearDown() {
        pacman = nil
    }
    
    func testUpdate(){
        let game = Game()
        pacman.state = .play
        for _ in 0..<2 {
            _ = pacman.update(game: game)
        }
        XCTAssert(pacman.tick == 1)
    }
    
    func testReset(){
        let game = Game()
        pacman.state = .play
        for _ in 0..<2 {
            _ = pacman.update(game: game)
        }
        pacman.reset()
        XCTAssert(pacman.tick == 0)
    }
}
