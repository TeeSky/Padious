//
//  PadView.swift
//  Padious
//
//  Created by Tomas Skypala on 07/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI

struct PadView: View {

    private static let minimumPadLongPressDuration = 0.25
    private static let padCornerRadius: CGFloat = 6

    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero

    private let audioPlayer: AudioPlaying

    private let padResource: PadResource
    private let superViewGeometry: GeometryProxy

    init(
        audioPlayer: AudioPlaying = AudioPlayer.shared,
        padResource: PadResource,
        superViewGeometry: GeometryProxy
    ) {
        self.audioPlayer = audioPlayer
        self.padResource = padResource
        self.superViewGeometry = superViewGeometry
    }

    var body: some View {
        let tapAndDragGesture = LongPressGesture(minimumDuration: Self.minimumPadLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, _ in
                switch value {
                // Long press begins.
                case .first(true):
                    state = .pressing
                    self.audioPlayer.playSound(with: self.padResource.soundURL)
                // Long press confirmed, dragging may begin.
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                // Dragging ended or the long press cancelled.
                default:
                    state = .inactive
                }
            }
            .onEnded { value in
                guard case .second(true, let drag?) = value else { return }
                self.viewState.width += drag.translation.width
                self.viewState.height += drag.translation.height
            }

        return Image(uiImage: UIImage(contentsOfFile: padResource.imageURL.path)!) // FIXME: get rid of the !
            .resizable()
            .scaledToFit()
            .cornerRadius(Self.padCornerRadius)
            .frame(
                width: superViewGeometry.size.width / 3,
                height: superViewGeometry.size.width / 3,
                alignment: .center
            )
            .gesture(tapAndDragGesture)
    }
}

extension PadView {

    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }

        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
}
