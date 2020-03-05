//
//  AudioPlayer.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import AVFoundation

class AudioPlayer: AudioPlaying {

    static let shared = AudioPlayer()

    var player: AVAudioPlayer?

    func playSound(with url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch {
            fatalError("Failed to initiate audio player with contents of provided URL.")
        }

        player?.play()
    }
}
