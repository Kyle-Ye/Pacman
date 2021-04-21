//
//  PelletTests.swift
//  PacmanTests
//
//  Created by Kyle on 2021/4/18.
//

import XCTest
@testable import Pacman

class PelletTests: XCTestCase {

    func testEatPellet1(){
        let game = Game()
        let pacman = PacMan(name: "test")
        pacman.eatPellet(game: game, 0, 1)
    }
    
    func testEatPellet2(){
        let game = Game()
        let pacman = PacMan(name: "test")
        pacman.eatPellet(game: game, 1, 0)
    }
    
    func testEatPellet3(){
        let game = Game()
        let pacman = PacMan(name: "test")
        pacman.eatPellet(game: game, 1, 1)
    }
    
    private func eatHelper(_ x:Int,_ y:Int){
        let game = Game()
        let pacman = PacMan(name: "test")
        pacman.eatPellet(game: game, x, y)
        
        let pellet = game.pellets.pellets[x][y]!
        XCTAssertTrue(pellet.isEaten)
    }
}
