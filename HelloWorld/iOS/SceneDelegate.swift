//
//  SceneDelegate.swift  
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import UIKit
import os

@available(iOS 13.0, *)
@objc(SceneDelegate) class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    os_log(">> willConnectTo session", log: OSLog.scene, type: .debug)
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
