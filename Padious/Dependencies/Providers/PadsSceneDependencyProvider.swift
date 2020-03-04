//
//  PadsSceneDependencyProvider.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

struct PadsSceneDependencyProvider: SceneDependencyProviding {
    
    var sceneHandler: WindowSceneHandling?
    
    func makeRootViewController() -> UIViewController {
        return PadsViewController(rootView: PadsContentView())
    }
    
}
