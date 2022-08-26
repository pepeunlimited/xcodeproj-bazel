//
//  HelloWorldViewController.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import UIKit

final class HelloWorldViewController: UIViewController {

  let rgbColorView: RGBColorView = RGBColorView(frame: .zero,
                                                translatesAutoresizingMaskIntoConstraints: false)

  // MARK: initializer

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: viewDidLoad

  override func viewDidLoad() {
    super.viewDidLoad()
    printLog()
    configureView()
    configureRGBColorView()
    rgbColorView.start(false)
  }

  // MARK: domain logic

  func configureView() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = backgroundColor
  }

  func configureRGBColorView() {
    view.addSubview(rgbColorView)
    NSLayoutConstraint.activate([
      rgbColorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      rgbColorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      rgbColorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      rgbColorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }

  // MARK: log

  func printLog() {
    let osActivityDTMode: String? = ProcessInfo.processInfo.environment["OS_ACTIVITY_DT_MODE"] as String?
    let variable1: String? = ProcessInfo.processInfo.environment["VARIABLE_1"] as String?
    let variable2: String? = ProcessInfo.processInfo.environment["VARIABLE_2"] as String?

    os_log(">> OS_ACTIVITY_DT_MODE=%@",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: osActivityDTMode))
    os_log(">> variable1=%@",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: variable1))
    os_log(">> variable2=%@",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: variable2))
    os_log(">> Localization.primaryText=%@",
           log: OSLog.viewCycle,
           type: .debug,
           Localization.primaryText)
  }
}

// MARK: HelloWorldViewController+ComputedProperties

extension HelloWorldViewController {

  var backgroundColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .black
        } else {
          return .white
        }
      }
    } else {
      return .black
    }
  }
}
