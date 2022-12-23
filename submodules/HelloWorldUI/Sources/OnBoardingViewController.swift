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

  let hStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .horizontal,
                                        isLayoutMarginsRelativeArrangement: true,
                                        alignment: .center,
                                        distribution: .fill)

  let contentView: UIStackView = UIStackView(frame: .zero,
                                             axis: .vertical,
                                             isLayoutMarginsRelativeArrangement: true,
                                             alignment: .center,
                                             distribution: .fill)

  let scrollView: UIScrollView = UIScrollView(frame: .zero,
                                              translatesAutoresizingMaskIntoConstraints: false)

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
    configureScrollView()
    configureContentView()
    configrureHeader()
  }

  func configureScrollView() {
    scrollView.backgroundColor = .clear
    view.addSubview(scrollView)
    // @see https://stackoverflow.com/a/64560447/3913343
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }

  func configureContentView() {
    scrollView.addSubview(hStack)
    NSLayoutConstraint.activate([
      hStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      hStack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      hStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      // vertical scroll
      hStack.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
    ])
    hStack.addArrangedSubview(contentView)
  }

  func configrureHeader() {
    // https://stackoverflow.com/questions/59064207/horizontal-uistackview-with-two-label-one-multiline-label-one-one-line
   let primaryTextLabel: UILabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryTextLabel.text = "primaryText"
    let secondaryTextLabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    secondaryTextLabel.text = "secondaryText"
    contentView.addArrangedSubview(primaryTextLabel)
    contentView.addArrangedSubview(secondaryTextLabel)
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
