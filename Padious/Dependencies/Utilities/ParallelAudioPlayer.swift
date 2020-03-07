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

    private let audioPlayerFactory: AudioPlayerFactoryProtocol

    var players: [UUID: AudioPlayer] = [:]

    init(audioPlayerFactory: AudioPlayerFactoryProtocol = AudioPlayerFactory()) {
        self.audioPlayerFactory = audioPlayerFactory
    }

    func playAudio(with url: URL, mode: ParallelPlayMode) {
        let playingID: UUID
        switch mode {
        case .sequential:           playingID = sequentialModeCommonID
        case .fullyParallel:        playingID = UUID()
        case .groupedByID(let id):  playingID = id
        }

        playAudio(with: url, uniqueBy: playingID)
    }

    private func playAudio(with url: URL, uniqueBy id: UUID) {
        players[id]?.stop()

        let player = audioPlayerFactory.makeAudioPlayer(with: id)
        player.delegate = self
        
        players[id] = player
        player.playSound(with: url)
    }

}

extension ParallelAudioPlayer: AudioPlayerDelegate {

    func audioPlayerDidStopPlaying(_ audioPlayer: AudioPlayer) {
        players.removeValue(forKey: audioPlayer.id)
    }

}
