//
//  SceneDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import HelloWorldUI
import os
import OSExtension
import UIKit

@available(iOS 13.0, *)
@objc(SceneDelegate) class SceneDelegaqte: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    os_log(">> willConnectTo session", log: OSLog.scene, type: .debug)
    guard let windowScene = scene as? UIWindowScene else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = MainCoordinator.shared.showLandingView()
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // TODO: sceneDidDisconnect
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // TODO: sceneDidBecomeActive
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // TODO: sceneWillResignActive
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // TODO: sceneWillEnterForeground
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // TODO: sceneDidEnterBackground
  }
}
