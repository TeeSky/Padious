//
//  SceneConfiguration.swift
//  Padious
//
//  Created by Tomáš Skýpala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

final class SceneConfiguration<DependencyProvider: SceneDependencyProviding>: UISceneConfiguration {

    init(sceneSession: UISceneSession) {
        super.init(name: "Scene Configuration - \(DependencyProvider.self)", sessionRole: sceneSession.role)

        self.delegateClass = SceneDelegate<DependencyProvider>.self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.delegateClass = SceneDelegate<DependencyProvider>.self
    }
}
