//
//  AudioUtil.swift
//  Pacman
//
//  Created by Kyle on 2021/4/14.
//

import AVFoundation
import AppKit

class AudioUtil {
    private var resourceName: String
    var player: AVAudioPlayer!

    private init(resourceName: String) {
        self.resourceName = resourceName
    }
    
    
    /// DO NOT call this function in main thread
    @discardableResult
    func preparePlayer() -> Bool{
        if let asset = NSDataAsset(name: self.resourceName) {
            do {
                player = try AVAudioPlayer(data: asset.data, fileTypeHint: "wav")
                return true
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return false
    }

    func playAudio() {
        if player == nil {
            DispatchQueue.global().async {
                self.preparePlayer()
                self.player.play()
            }
        } else {
            DispatchQueue.global().async {
                self.player.play()
            }
        }
        
    }

    static let beginning = AudioUtil(resourceName: "pacman_beginning")
    static let chomp = AudioUtil(resourceName: "pacman_chomp")
    static let death = AudioUtil(resourceName: "pacman_death")
    static let eatfruit = AudioUtil(resourceName: "pacman_eatfruit")
    static let eatghost = AudioUtil(resourceName: "pacman_eatghost")
    static let extrapac = AudioUtil(resourceName: "pacman_extrapac")
    static let intermission = AudioUtil(resourceName: "pacman_intermission")
}

