//
//  ParallelAudioPlaying.swift
//  Padious
//
//  Created by Tomas Skypala on 07/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

enum ParallelPlayMode {
    case fullyParallel
    case groupedByID(UUID)
    case sequential
}

protocol ParallelAudioPlaying {

    func playAudio(with url: URL, mode: ParallelPlayMode)
}
