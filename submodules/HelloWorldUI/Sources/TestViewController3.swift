//
//  TestViewController3.swift
//
//  Copyright 2023 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import OSExtension
import SharedKit
import UIKit
import UIKitExtension

// https://stackoverflow.com/questions/50766400/center-uiview-vertically-in-scroll-view-when-its-dynamic-labels-are-small-enough
// https://sheikhamais.medium.com/ios-auto-layout-less-than-greater-than-constraints-6f73cf99dfb0

public final class TestViewController3: UIViewController {

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
    os_log("TestViewController2.swift >> viewDidLoad", log: OSLog.viewCycle, type: .debug)
    configureView()
    configureNavigationBar()
    let hStack = UIStackView(frame: .zero, axis: .horizontal, alignment: .fill, distribution: .fill)
    view.addSubview(hStack)
    NSLayoutConstraint.activate([
      hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    
    ])

    let primaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryTextLabel.text = "Test View 3"
    hStack.addArrangedSubview(primaryTextLabel)
    // vStack.setContentHuggingPriority(.defaultLow, for: .horizontal)
    primaryTextLabel.textAlignment = .center
    // primaryTextLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    
    let secondaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    secondaryTextLabel.text = "secondaryText"
    // secondaryTextLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    // secondaryTextLabel.textAlignment = .center
    //hStack.addArrangedSubview(secondaryTextLabel)

    let leadingImageView: UIImageView = UIImageView(image: UIImage(named: "bazel"))
    leadingImageView.contentMode = .scaleAspectFill

    let widthConstraint = leadingImageView.widthAnchor.constraint(equalToConstant: 48)
    widthConstraint.priority = .required

    let heightConstraint = leadingImageView.heightAnchor.constraint(equalToConstant: 48)
    heightConstraint.priority = .required

    hStack.insertArrangedSubview(leadingImageView, at: 0)
    leadingImageView.addConstraints([widthConstraint, heightConstraint])

    let trailingImageView: UIImageView = UIImageView(image: UIImage(named: "bazel"))
    trailingImageView.contentMode = .scaleAspectFill

    let widthConstraint2 = trailingImageView.widthAnchor.constraint(equalToConstant: 24)
    widthConstraint2.priority = .required

    let heightConstraint2 = trailingImageView.heightAnchor.constraint(equalToConstant: 24)
    heightConstraint2.priority = .required

    // hStack.insertArrangedSubview(trailingImageView, at: 2)
    trailingImageView.addConstraints([widthConstraint2, heightConstraint2])
  }

  // MARK: viewDidLayoutSubviews

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    os_log("TestViewController.swift >> viewDidLayoutSubviews", log: OSLog.viewCycle, type: .debug)
  }

  // MARK: Configure

  func configureView() {
    // view.translatesAutoresizingMaskIntoConstraints = false // FIXES position and size are ambiguous. DO NOT UNCOMMENT
    view.backgroundColor = backgroundColor
  }

  func configureNavigationBar() {
    title = "Test View 3"
  }

}

// MARK: TestViewController3 + ComputedProperties

extension TestViewController3 {

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
