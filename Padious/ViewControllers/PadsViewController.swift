//
//  PadsViewController.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import SwiftUI
import AVFoundation

final class PadsViewController: UIHostingController<PadsContentView> {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        try? AVAudioSession.sharedInstance().setActive(false)
    }
}
