//
//  PadResourcesProviding.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

protocol SoundEffect {

    func play()
}

struct PadResource {

    let imageURL: URL
    let soundEffect: SoundEffect
}

protocol PadResourcesProviding {

    func getPadResources() -> [PadResource]
}
