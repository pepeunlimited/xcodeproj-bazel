//
//  AppDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import UIKit
import os

@objc(AppDelegate) class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {
      // @see more at SceneDelegate.swift
      os_log(">> prevented didFinishLaunchingWithOptions > 13.0", log: OSLog.app, type: .debug)
    } else {
      os_log(">> didFinishLaunchingWithOptions", log: OSLog.app, type: .debug)
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = UIViewController()
      window?.rootViewController?.view.backgroundColor = .red
      window?.makeKeyAndVisible()
    }
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // NOT #available(iOS 13.0, *)
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // NOT #available(iOS 13.0, *)
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // NOT #available(iOS 13.0, *)
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // NOT #available(iOS 13.0, *)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration",
                                sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

  }
}
