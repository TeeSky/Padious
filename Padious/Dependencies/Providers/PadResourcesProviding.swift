//
//  PadResourcesProviding.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

struct PadResource {

    let uuid = UUID()

    let imageURL: URL
    let soundURL: URL
}

protocol PadResourcesProviding {

    var padResources: [PadResource] { get }
}
