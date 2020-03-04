//
//  PadResourcesProviding.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

protocol SoundEffect {

    func play()
}

struct PadResource {

    let image: UIImage
    let soundEffect: SoundEffect
}

protocol PadResourcesProviding {

    func getPadResources() -> [PadResource]
}
