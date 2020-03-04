//
//  AppDelegate.swift
//  Padious
//
//  Created by Tomas Skypala on 19/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return MainPadSceneConfiguration(sceneSession: connectingSceneSession)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after
        // application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

private final class MainPadSceneConfiguration: UISceneConfiguration {

    private static let configName = "Main Pad Scene Configuration"
    private static let delegateClass = SceneDelegate.self

    init(sceneSession: UISceneSession) {
        super.init(name: Self.configName, sessionRole: sceneSession.role)

        self.delegateClass = Self.delegateClass
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.delegateClass = Self.delegateClass
    }
}
