//
//  AudioPlayerFactory.swift
//  Padious
//
//  Created by Tomas Skypala on 07/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

protocol AudioPlayerFactoryProtocol {

    func makeAudioPlayer(with id: UUID) -> AudioPlayer
}

struct AudioPlayerFactory: AudioPlayerFactoryProtocol {

    static var shared = AudioPlayerFactory()

    func makeAudioPlayer(with id: UUID) -> AudioPlayer {
        return AudioPlayer(id: id)
    }
}
