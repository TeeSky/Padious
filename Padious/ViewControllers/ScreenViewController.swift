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

    var screenView: SV? {
        return view as? SV
    }

    override func loadView() {
        view = SV()
        screenView?.setupSubviews()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        screenView?.updateColorsWith(theme.getAppColorFor(self.traitCollection))
    }
}
