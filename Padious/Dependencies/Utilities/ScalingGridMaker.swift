//
//  ScalingGridMaker.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

struct ScalingGridMaker: GridMaking {

    enum Orientation {
        case vertical
        case horizontal
        case unknown
    }

    var orientation: Orientation?

    func makeGrid<Element>(from elements: [Element]) -> [GridRow<Element>] {
        let currentOrientation = orientation ?? .unknown
        return elements.chunked(into: currentOrientation.rowSize).map { GridRow($0) }
    }

}

private extension ScalingGridMaker.Orientation {

    var rowSize: Int {
        switch self {
        case .vertical:     return 3
        case .horizontal:   return 3
        case .unknown:      return 3
        }
    }
}
