//
//  PadCollectionView.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI

struct PadCollectionView: View {

    static let imageCornerRadius: CGFloat = 8

    private let audioPlayer: ParallelAudioPlaying
    private let padResourcesProvider: PadResourcesProviding
    private let gridMaker: GridMaking

    init(
        audioPlayer: ParallelAudioPlaying = ParallelAudioPlayer(),
        padResourcesProvider: PadResourcesProviding = PadResourcesProvider(),
        gridMaker: GridMaking = ScalingGridMaker()
    ) {
        self.audioPlayer = audioPlayer
        self.padResourcesProvider = padResourcesProvider
        self.gridMaker = gridMaker

        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        let padsGrid = gridMaker.makeGrid(from: padResourcesProvider.padResources)

        return ForEach(padsGrid) { gridRow in
            GeometryReader { geometry in
                HStack {
                    ForEach(gridRow.elements) { padResource in
                        PadView(audioPlayer: self, padResource: padResource, superViewGeometry: geometry.self)
                    }
                }
            }.frame(height: 90)
        }
    }
}

extension PadCollectionView: PadViewAudioPlaying {

    func playAudio(for resource: PadResource) {
        audioPlayer.playAudio(with: resource.soundURL, mode: .sequential)
    }

}

extension GridRow: Identifiable {
}

extension PadResource: Identifiable {
}
