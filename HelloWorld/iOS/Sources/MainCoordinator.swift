//
//  MainCoordinator.swift
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

final class MainCoordinator {

  // reference for UINavigationController
  var navigationController: UINavigationController?

  static let shared: MainCoordinator = {
    return MainCoordinator()
  }()

  func showLandingView() -> UIViewController {
    TestViewController()
  }

  var feedVC: UIViewController {
    let feedVC = FeedViewController()
    feedVC.delegate = self
    navigationController = UINavigationController(rootViewController: feedVC)
    return navigationController!
  }
}

// MARK: MainCoordinator+FeedViewDelegate

extension MainCoordinator: FeedViewDelegate {

  func feedView(_ feedView: FeedViewController, didSelectItem item: String, animated: Bool) {
    os_log("MainCoordinator.swift >> FeedViewDelegate.swift >> didSelectItem: %@",
           log: OSLog.coordinator,
           type: .debug,
           String(describing: item))
    navigationController?.pushViewController(WhatsNewViewController(), animated: animated)
  }
}
