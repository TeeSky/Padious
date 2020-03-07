//
//  ParallelAudioPlayer.swift
//  Padious
//
//  Created by Tomas Skypala on 07/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

class ParallelAudioPlayer: ParallelAudioPlaying {

    private let sequentialModeCommonID: UUID = UUID()

    var players: [UUID: AudioPlayer] = [:]

    func playAudio(with url: URL, mode: ParallelPlayMode) {
        let playingID: UUID
        switch mode {
        case .sequential:       playingID = sequentialModeCommonID
        case .fullyParallel:    fatalError("not implemented")
        case .groupedByID:      fatalError("not implemented")
        }

        playAudio(with: url, uniqueBy: playingID)
    }

    private func playAudio(with url: URL, uniqueBy id: UUID) {
        players[id]?.stop()

        let player = AudioPlayer(id: id)
        players[id] = player
        player.playSound(with: url)
    }

}

extension ParallelAudioPlayer: AudioPlayerDelegate {

    func audioPlayerDidStopPlaying(_ audioPlayer: AudioPlayer) {
        players.removeValue(forKey: audioPlayer.id)
    }

}
