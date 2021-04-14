//
//  GameScene.swift
//  Pacman
//
//  Created by Kyle on 2021/4/7.
//

import AVFoundation
import GameplayKit
import SpriteKit

class GameScene: SKScene {
    let game = Game()
    var audioPlayer: AVAudioPlayer?

    override func didMove(to view: SKView) {
        game.view = view
    }

    override func sceneDidLoad() {
        backgroundColor = .black

//        game.gameNode.position.x = 0
        addChild(game.gameNode)
        // play beginning when playing
//        DispatchQueue.global().async {
//            let audio = AudioUtil.beginning
//            audio.preparePlayer()
//            audio.player.numberOfLoops = -1
//            audio.playAudio()
//        }
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x0:
            game.handleButtonA(pressed: true)
        case 123:
            game.desiredDirection = .left
        case 124:
            game.desiredDirection = .right
        case 126:
            game.desiredDirection = .up
        case 125:
            game.desiredDirection = .down
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x0:
            game.handleButtonA(pressed: false)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        audioPlayer?.rate = game.scaredTimer != 0 ? 1.2 : 1.0
        game.update()
    }
}
