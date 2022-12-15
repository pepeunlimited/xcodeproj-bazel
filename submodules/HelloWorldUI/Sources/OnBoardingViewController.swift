//
//  OnBoardingViewController.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import OSExtension
import UIKit
import UIKitExtension

public final class OnBoardingViewController: UIViewController {

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    os_log("OnBoardingViewController.swift >> viewDidLoad", log: OSLog.viewCycle, type: .debug)
    configureView()
  }

  func configureView() {
    view.backgroundColor = backgroundColor
  }

}

extension OnBoardingViewController {

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

  var textColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .white
        } else {
          return .black
        }
      }
    } else {
      return .white
    }
  }

}
