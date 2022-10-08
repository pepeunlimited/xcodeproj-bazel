//
//  AppDelegate.swift
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

@objc(AppDelegate) class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    true
  }

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {
      // @see more at SceneDelegate.swift
      os_log(">> skip didFinishLaunchingWithOptions function, iOS version is greater than 13",
             log: OSLog.app, type: .debug)
    } else {
      os_log(">> didFinishLaunchingWithOptions", log: OSLog.app, type: .debug)
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = HelloWorldViewController()
      window?.makeKeyAndVisible()
    }
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // NOTICE: not executed if #available(iOS 13.0, *)
    // TODO: applicationWillResignActive
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // NOTICE: not executed if #available(iOS 13.0, *)
    // TODO: applicationDidEnterBackground
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // NOTICE: not executed if #available(iOS 13.0, *)
    // TODO: applicationWillEnterForeground
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // NOTICE: not executed if #available(iOS 13.0, *)
    // TODO: applicationDidBecomeActive
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration",
                         sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // TODO: didDiscardSceneSessions
  }
}
