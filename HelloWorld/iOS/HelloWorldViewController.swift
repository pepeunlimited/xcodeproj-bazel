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

  let scrollView: UIScrollView = UIScrollView(frame: .zero,
                                              translatesAutoresizingMaskIntoConstraints: false)

  // MARK: Initializer

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
    configureScrollView()
    configureRGBColorView()
    rgbColorView.start(false)

  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    os_log(">> view=%@",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: view.frame.size))
  }

  // MARK: Configure

  func configureView() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = backgroundColor
  }

  func configureScrollView() {
    scrollView.backgroundColor = .clear
    view.addSubview(scrollView)
    // @see https://stackoverflow.com/a/64560447/3913343
    NSLayoutConstraint.activate([
      // scrollView
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      // contentView
      // contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      // contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      // contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      // contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      // vertical scroll
      // contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
    ])
  }

  func configureRGBColorView() {
    scrollView.addSubview(rgbColorView)
    rgbColorView.contentViewSize = view.frame.size
    NSLayoutConstraint.activate([
      rgbColorView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      rgbColorView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      rgbColorView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      rgbColorView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      // vertical scroll
      rgbColorView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
    ])
  }

  // MARK: os_log

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
