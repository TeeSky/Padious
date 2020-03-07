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

    private let padResourcesProvider: PadResourcesProviding
    private let audioPlayer: AudioPlaying
    private let gridMaker: GridMaking

    init(
        padResourcesProvider: PadResourcesProviding = PadResourcesProvider(),
        audioPlayer: AudioPlaying = AudioPlayer.shared,
        gridMaker: GridMaking = ScalingGridMaker()
    ) {
        self.padResourcesProvider = padResourcesProvider
        self.audioPlayer = audioPlayer
        self.gridMaker = gridMaker

        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        let padsGrid = gridMaker.makeGrid(from: padResourcesProvider.padResources)

        return ForEach(padsGrid) { gridRow in
            GeometryReader { geometry in
                HStack {
                    ForEach(gridRow.elements) { padResource in
                        Image(uiImage: UIImage(contentsOfFile: padResource.imageURL.path)!) // FIXME: get rid of the !
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(Self.imageCornerRadius)
                            .frame(
                                width: geometry.size.width / 3,
                                height: geometry.size.width / 3,
                                alignment: .center
                            )
                            .onTapGesture {
                                self.audioPlayer.playSound(with: padResource.soundURL)
                            }
                    }
                }
            }.frame(height: 125)
        }
    }
}

extension GridRow: Identifiable {
}

extension PadResource: Identifiable {
}
