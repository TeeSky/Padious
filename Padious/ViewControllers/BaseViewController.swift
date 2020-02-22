//
//  BaseViewController.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

class BaseViewController<ScreenView: BaseScreenView>: UIViewController {

    open var theme: ColorProviding = Shared.appTheme

    var screenView: ScreenView {
        guard let screenView = view as? ScreenView else {
            assertionFailure("View controller's screen view \(ScreenView.Type.self) found nil.")
            let screenView = ScreenView()
            self.view = screenView
            return screenView
        }
        return screenView
    }

    override func loadView() {
        view = ScreenView()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        screenView.updateColorsWith(theme.getAppColorFor(self.traitCollection))
    }
}
