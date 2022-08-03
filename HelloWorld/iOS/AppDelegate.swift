//
//  AppDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import UIKit

@objc(AppDelegate) class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {
      // Do nothing if the iOS version is greater than 13.
      // @see SceneDelegate.swift
      print("AppDelegate = didFinishLaunchingWithOptions 1")
    } else {
      print("AppDelegate = didFinishLaunchingWithOptions 2")
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = UIViewController()
      window?.rootViewController?.view.backgroundColor = .red
      window?.makeKeyAndVisible()
    }
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // #available(iOS 13.0, *)
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // #available(iOS 13.0, *)
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // #available(iOS 13.0, *)
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // #available(iOS 13.0, *)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration",
                                sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running,
    // this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes,
    // as they will not return.
  }
}
