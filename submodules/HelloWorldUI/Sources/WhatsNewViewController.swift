//
//  WhatsNewViewController.swift
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

public final class WhatsNewViewController: UIViewController {

  let scrollView: UIScrollView = UIScrollView(frame: .zero,
                                              translatesAutoresizingMaskIntoConstraints: false)

  let hStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .horizontal,
                                        alignment: .top,
                                        distribution: .fill)

  let vStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .vertical,
                                        alignment: .leading,
                                        distribution: .fill)

  let footerVStack: UIStackView = UIStackView(frame: .zero,
                                              axis: .vertical,
                                              isLayoutMarginsRelativeArrangement: true,
                                              alignment: .center,
                                              distribution: .fill)

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
    os_log("WhatsNewViewController.swift >> viewDidLoad", log: OSLog.viewCycle, type: .debug)
    configureView()
    configureFooterVStack()
    configureScrollView()
    configureContentView()
    configureNavigationBar()
  }

  // MARK: viewDidLayoutSubviews

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    os_log("WhatsNewViewController.swift >> viewDidLayoutSubviews", log: OSLog.viewCycle, type: .debug)
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
      scrollView.bottomAnchor.constraint(equalTo: footerVStack.topAnchor),
      // contentView
      // contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      // contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      // contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      // contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      // vertical scroll
      // contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
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
    hStack.addArrangedSubview(vStack)
    let primaryText: UILabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryText.text = "What's New in xcodeproj-bazel"
    vStack.addArrangedSubview(primaryText)
  }

  func configureFooterVStack() {
    // footerVStack
    view.addSubview(footerVStack)
    NSLayoutConstraint.activate([
      footerVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      footerVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      footerVStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    footerVStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                    leading: 32,
                                                                    bottom: 0,
                                                                    trailing: 32)
    // primaryBtn
    let primaryBtn: UILabel = UILabel(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    primaryBtn.text = "primaryBtn"
    footerVStack.addArrangedSubview(primaryBtn)
    // secondaryBtn
    let btn = UIButton(type: .system)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("Continue", for: .normal)
    btn.contentEdgeInsets = .init(top: 16,
                                  left: .zero,
                                  bottom: 16,
                                  right: .zero)
    btn.setBackgroundColor(.red, cornerRadius: 16, for: .normal)
    footerVStack.addArrangedSubview(btn)
    let width = btn.widthAnchor.constraint(equalTo: footerVStack.widthAnchor, multiplier: 1.0)
    width.priority = .init(rawValue: 999) // @see https://stackoverflow.com/a/38064687/3913343
    width.isActive = true
  }

  func configureNavigationBar() {
    title = "Spacer View"
  }

}

// MARK: WhatsNewViewController+ComputedProperties

extension WhatsNewViewController {

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
