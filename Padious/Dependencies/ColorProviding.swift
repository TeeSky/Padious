//
//  ColorProviding.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

protocol ColorProviding {

    func getAppColorFor(_ traitCollection: UITraitCollection) -> AppColorProtocol
}
