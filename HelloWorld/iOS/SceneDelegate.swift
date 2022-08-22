//
//  SceneDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import os
import UIKit

@available(iOS 13.0, *)
@objc(SceneDelegate) class SceneDelegaqte: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let osActivityDTMode: String? = ProcessInfo.processInfo.environment["OS_ACTIVITY_DT_MODE"] as String?
    let variable1: String? = ProcessInfo.processInfo.environment["VARIABLE_1"] as String?
    let variable2: String? = ProcessInfo.processInfo.environment["VARIABLE_2"] as String?

    os_log(">> willConnectTo session", log: OSLog.scene, type: .debug)
    print(osActivityDTMode)
    print(variable1)
    print(variable2)
    print(Localization.HELLOWORLD_PRIMARY_TEXT)
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = UIViewController()
    window?.rootViewController?.view.backgroundColor = .red
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
  }

  func sceneWillResignActive(_ scene: UIScene) {
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
  }
}
