//
//  SoundPlayer.swift
//  twerkout
//
//  Created by Zach Mell on 1/29/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAVSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}
