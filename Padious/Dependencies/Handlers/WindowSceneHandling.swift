//
//  WindowSceneHandling.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

protocol WindowSceneHandling {

    func windowWillBecomeVisible(_ window: UIWindow)

    func windowDidBecomeVisible(_ window: UIWindow)
}
