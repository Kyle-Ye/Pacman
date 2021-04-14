//
//  AudioTests.swift
//  PacmanTests
//
//  Created by Kyle on 2021/4/14.
//

@testable import Pacman
import XCTest

class AudioTests: XCTestCase {
    override func setUp() {
        print("Audio Test Begin")
    }

    override func tearDown() {
        print("Audio Test End")
    }

    private func testAudio(for audio: AudioUtil) {
        let result = audio.preparePlayer()
        XCTAssertTrue(result)
    }

    func testAllAudios() {
        let audios: [AudioUtil] = [.beginning, .chomp, .death,
                                   .eatfruit, .eatghost, .extrapac,
                                   .intermission]
        for audio in audios {
            testAudio(for: audio)
        }
    }

    func testBeginningAudio() {
        let audio = AudioUtil.beginning
        testAudio(for: audio)
        audio.playAudio()
        let expection = XCTestExpectation()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + audio.player.duration) {
            expection.fulfill()
        }
        wait(for: [expection], timeout: 10)
    }

    func testDeathAudio() {
        let audio = AudioUtil.death
        testAudio(for: audio)
        audio.playAudio()
        let expection = XCTestExpectation()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + audio.player.duration) {
            expection.fulfill()
        }
        wait(for: [expection], timeout: 10)
    }
}
