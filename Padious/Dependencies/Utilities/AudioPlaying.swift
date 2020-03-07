//
//  AudioPlaying.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

protocol AudioPlaying: Identifiable {

    func playAudio(with url: URL)
}
