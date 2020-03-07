//
//  ScreenView.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

protocol ScreenView: UIView {

    func setupSubviews()

    func updateColorsWith(_ appColor: AppColorProtocol)
}

extension ScreenView {

    init() {
        self.init()
        setupSubviews()
    }
}
