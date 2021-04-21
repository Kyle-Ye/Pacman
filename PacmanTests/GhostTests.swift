//
//  GhostTests.swift
//  PacmanTests
//
//  Created by Kyle on 2021/4/18.
//

import XCTest
@testable import Pacman

class GhostTests: XCTestCase {

    var ghost: Ghost!
    
    override func setUp() {
        let ghosts = [Blinky(name: "test"), Clyde(name: "test"), Inky(name: "test"), Pinky(name: "test")]
        ghost = ghosts.randomElement()
    }
    
    override func tearDown() {
        ghost = nil
    }
    
    func testUpdate(){
        let game = Game()
        ghost.state = .play
        for _ in 0..<2 {
            _ = ghost.update(game: game)
        }
        XCTAssert(ghost.tick == 1)
    }
    
    func testReset(){
        let game = Game()
        ghost.state = .play
        for _ in 0..<2 {
            _ = ghost.update(game: game)
        }
        ghost.reset()
        XCTAssert(ghost.tick == 0)
    }
}
