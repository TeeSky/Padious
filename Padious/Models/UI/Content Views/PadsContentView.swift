//
//  PadsContentView.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI

struct PadsContentView: View {

    private let gridMaker: GridMaking

    @Environment(\.verticalSizeClass) private var verticalSizeClass: UserInterfaceSizeClass?

    init(
        gridMaker: GridMaking = ScalingGridMaker()
    ) {
        self.padResourcesProvider = padResourcesProvider
        self.gridMaker = gridMaker
    }

    var body: some View {
        Text("Hello World.")
    }
}

private extension ScalingGridMaker.Orientation {

    init(verticalSizeClass: UserInterfaceSizeClass) {
        switch verticalSizeClass {
        case .compact:      self = .vertical
        case .regular:      self = .horizontal
        @unknown default:   self = .unknown
        }
    }
}
