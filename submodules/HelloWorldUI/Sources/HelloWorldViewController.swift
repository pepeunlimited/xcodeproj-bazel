//
//  HelloWorldViewController.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import OSExtension
import SharedKit
import UIKit
import UIKitExtension

public final class HelloWorldViewController: UIViewController {

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

  public override func viewDidLoad() {
    super.viewDidLoad()
    os_log("HelloWorldViewControllers.swift >> viewDidLoad",
           log: OSLog.viewCycle,
           type: .debug)
    printLog()
    configureView()
    configureScrollView()
    configureRGBColorView()
    configureNavigationBar()
    rgbColorView.start(true)
  }

  // MARK: viewDidLayoutSubviews

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    os_log("HelloWorldViewControllers.swift >> viewDidLayoutSubviews >> view=%@",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: view.frame.size))
  }

  // MARK: Configure

  func configureView() {
    // view.translatesAutoresizingMaskIntoConstraints = false // FIXES position and size are ambiguous. DO NOT UNCOMMENT
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
    rgbColorView.columns = 25
    rgbColorView.rows = 50
    NSLayoutConstraint.activate([
      rgbColorView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      rgbColorView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      rgbColorView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      rgbColorView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      // vertical scroll
      rgbColorView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
    ])
  }

  func configureNavigationBar() {
    title = "Hello World"
  }

  // MARK: os_log

  func printLog() {

    let osActivityDTMode: String? = ProcessInfo.processInfo.environment["OS_ACTIVITY_DT_MODE"] as String?
    let variable1: String? = ProcessInfo.processInfo.environment["VARIABLE_1"] as String?
    let variable2: String? = ProcessInfo.processInfo.environment["VARIABLE_2"] as String?
    let greeting: String = Haberdasher.shared.greeting

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
    os_log(">> Haberdasher.shared.greeting=%@",
           log: OSLog.viewCycle,
           type: .debug,
           greeting)
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
