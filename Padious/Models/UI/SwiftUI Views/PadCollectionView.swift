//
//  PadCollectionView.swift
//  Padious
//
//  Created by Tomas Skypala on 05/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI

struct PadCollectionView: View {

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
    }

    var body: some View {

        ForEach(padResourcesProvider.padResources, id: \.uuid) { padResource in
            Image(uiImage: UIImage(contentsOfFile: padResource.imageURL.path)!) // FIXME: get rid of the !
                .resizable()
                .scaledToFill()
                .cornerRadius(8)
                .gesture(TapGesture().onEnded({ self.audioPlayer.playSound(with: padResource.soundURL) }))
        }
    }
}
