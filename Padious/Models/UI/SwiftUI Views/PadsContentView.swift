//
//  PadsContentView.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI

struct PadsContentView: View {

    private let padResourcesProvider: PadResourcesProviding
    private let gridMaker: GridMaking

    @Environment(\.verticalSizeClass) private var verticalSizeClass: UserInterfaceSizeClass?

    init(
        padResourcesProvider: PadResourcesProviding = PadResourcesProvider(),
        gridMaker: GridMaking = ScalingGridMaker()
    ) {
        self.padResourcesProvider = padResourcesProvider
        self.gridMaker = gridMaker
    }

    var body: some View {
        NavigationView {
            List {
                PadCollectionView(padResourcesProvider: padResourcesProvider)
            }
        }
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
