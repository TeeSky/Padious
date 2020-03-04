//
//  ScreenViewController.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

class ScreenViewController<SV: ScreenView>: UIViewController {

    open var theme: ColorProviding = Shared.appTheme

    var screenView: SV {
        guard let screenView = view as? SV else {
            assertionFailure("View controller's screen view \(SV.Type.self) found nil.")
            let screenView = SV()
            self.view = screenView
            return screenView
        }
        return screenView
    }

    override func loadView() {
        view = SV()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        screenView.updateColorsWith(theme.getAppColorFor(self.traitCollection))
    }
}
