//
//  AudioPlayer.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import AVFoundation

protocol AudioPlayerDelegate: AnyObject {

    func audioPlayerDidStopPlaying(_ audioPlayer: AudioPlayer)
}

class AudioPlayer: NSObject, AudioPlaying {

    static let shared = AudioPlayer()

    weak var delegate: AudioPlayerDelegate?

    var player: AVAudioPlayer?

    func playSound(with url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch {
            fatalError("Failed to initiate audio player with contents of provided URL.")
        }
        player?.delegate = self
        player?.play()
    }

    func stop() {
        if player?.isPlaying ?? false {
            // This does not trigger the delegate, no need to return.
            player?.stop()
        }
        player = nil

        delegate?.audioPlayerDidStopPlaying(self)
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stop()
    }

    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        stop()
    }
}
