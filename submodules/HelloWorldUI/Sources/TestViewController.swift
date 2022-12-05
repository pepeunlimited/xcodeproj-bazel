//
//  TestViewController.swift
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

public final class TestViewController: UIViewController {

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
    os_log("TestViewController.swift >> viewDidLoad", log: OSLog.viewCycle, type: .debug)
    configureView()
    configureNavigationBar()
    // -------
    let hStack = UIStackView(frame: .zero, axis: .horizontal, alignment: .center, distribution: .fill)
    hStack.translatesAutoresizingMaskIntoConstraints = false
    let vStack = UIStackView(frame: .zero, axis: .vertical, alignment: .leading, distribution: .fill)
    vStack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(hStack)
    NSLayoutConstraint.activate([
      hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    hStack.addArrangedSubview(vStack)

    let primaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryTextLabel.text = "primaryText"
    vStack.addArrangedSubview(primaryTextLabel)
  }

  // https://stackoverflow.com/questions/59064207/horizontal-uistackview-with-two-label-one-multiline-label-one-one-line
  func configureContentView(primaryText: String? = nil, secondaryText: String? = nil) -> UIStackView {
    let contentView = UIStackView(frame: .zero, axis: .horizontal, alignment: .center, distribution: .fill)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    // ------- primaryTextLabel
    let primaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryTextLabel.text = primaryText
    // primaryTextLabel.setContentHuggingPriority(.init(251), for: .horizontal)
    // primaryTextLabel.setContentCompressionResistancePriority(.init(750), for: .horizontal)
    contentView.addArrangedSubview(primaryTextLabel)
    // ------- secondaryTextLabel
    let secondaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    secondaryTextLabel.text = secondaryText
    secondaryTextLabel.setContentHuggingPriority(.required, for: .horizontal)
    secondaryTextLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    // -------
    contentView.addArrangedSubview(secondaryTextLabel)
    return contentView
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
    title = "Test View"
  }

}

// MARK: TestViewController+ComputedProperties

extension TestViewController {

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
