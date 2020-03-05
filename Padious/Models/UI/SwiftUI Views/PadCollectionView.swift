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

    init(padResourcesProvider: PadResourcesProviding) {
        self.padResourcesProvider = padResourcesProvider
    }

    var body: some View {

        ForEach(padResourcesProvider.padResources, id: \.uuid) {
            Image(uiImage: UIImage(contentsOfFile: $0.imageURL.path)!)
                .resizable()
                .scaledToFill()
                .cornerRadius(8)
                .gesture(TapGesture().onEnded({}))
        }
    }
}
