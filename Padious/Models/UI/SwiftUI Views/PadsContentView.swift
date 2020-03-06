//
//  PadsContentView.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI
import AVFoundation

struct PadsContentView: View {

    @Environment(\.verticalSizeClass) private var verticalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        NavigationView {
            List {
                PadCollectionView()
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
