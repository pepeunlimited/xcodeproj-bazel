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
    navigationController = UINavigationController(rootViewController: TestViewController3())
    return navigationController!
  }

  var feedVC: UIViewController {
    let feedVC = FeedViewController()
    feedVC.delegate = self
    return feedVC
  }

  var pageViewController: UIViewController {
    let vc: PageViewController = PageViewController()
    let onboardingVC0 = OnBoardingViewController()
    onboardingVC0.view.backgroundColor = .red
    let onboardingVC1 = OnBoardingViewController()
    onboardingVC1.view.backgroundColor = .green
    let onboardingVC2 = OnBoardingViewController()
    onboardingVC2.view.backgroundColor = .blue
    vc.viewControllers = [onboardingVC0, onboardingVC1, onboardingVC2]
    return vc
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
