//
//  BaseScreenView.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

protocol BaseScreenView: UIView {

    func setupSubviews()

    func updateColorsWith(_ appColor: AppColorProtocol)
}

extension BaseScreenView {

    init() {
        self.init()
        setupSubviews()
    }
}
