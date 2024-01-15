//
//  TestViewController2.swift
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

public final class TestViewController2: UIViewController {

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
    let hStack = UIStackView(frame: .zero, axis: .horizontal, alignment: .center, distribution: .fill)
    let vStack = UIStackView(frame: .zero, axis: .vertical, alignment: .leading, distribution: .fill)
    view.addSubview(hStack)
    NSLayoutConstraint.activate([
      hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    hStack.addArrangedSubview(vStack)

    let leadingVStack = UIStackView(frame: .zero, axis: .vertical, alignment: .fill, distribution: .fill)
    let trailingVStack = UIStackView(frame: .zero, axis: .vertical, alignment: .trailing, distribution: .fill)
    hStack.insertArrangedSubview(leadingVStack, at: 0)
    hStack.insertArrangedSubview(trailingVStack, at: 2)

    let primaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryTextLabel.text = "primaryText"
    vStack.addArrangedSubview(primaryTextLabel)
    let secondaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    secondaryTextLabel.text = "secondaryText"
    vStack.addArrangedSubview(secondaryTextLabel)

    let leadingImageView: UIImageView = UIImageView(image: UIImage(named: "bazel"))
    leadingImageView.contentMode = .scaleAspectFill

    let widthConstraint = leadingImageView.widthAnchor.constraint(equalToConstant: 48)
    widthConstraint.priority = .required

    let heightConstraint = leadingImageView.heightAnchor.constraint(equalToConstant: 48)
    heightConstraint.priority = .required

    leadingVStack.addArrangedSubview(leadingImageView)
    leadingImageView.addConstraints([widthConstraint, heightConstraint])

    let trailingImageView: UIImageView = UIImageView(image: UIImage(named: "bazel"))
    trailingImageView.contentMode = .scaleAspectFill

    let widthConstraint2 = trailingImageView.widthAnchor.constraint(equalToConstant: 24)
    widthConstraint2.priority = .required

    let heightConstraint2 = trailingImageView.heightAnchor.constraint(equalToConstant: 24)
    heightConstraint2.priority = .required

    trailingVStack.addArrangedSubview(trailingImageView)
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
    title = "Test View 2"
  }

}

// MARK: TestViewController2 + ComputedProperties

extension TestViewController2 {

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
