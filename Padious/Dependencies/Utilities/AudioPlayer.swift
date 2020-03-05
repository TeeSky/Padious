//
//  AudioPlayer.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import AVFoundation

struct AudioPlayer: AudioPlaying {

    static let shared = Self()

    func playSound(with url: URL) {
        var avPlayer = AVAudioPlayer()
        do {
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.playback,
                mode: AVAudioSession.Mode.default
            )
            try AVAudioSession.sharedInstance().setActive(true)

            avPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            avPlayer.volume = 1.0
            avPlayer.prepareToPlay()
            
            avPlayer.play() // FIXME: does not play any sound
        } catch {
            fatalError("not implemented")
        }
    }
}
