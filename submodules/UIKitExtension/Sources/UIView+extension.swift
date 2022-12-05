//
//  UIView+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UIView {

  convenience init(frame: CGRect,
                   translatesAutoresizingMaskIntoConstraints: Bool = false) {
    self.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
  }

  func edges(equalTo view: UIView,
             topPriority: UILayoutPriority = .required,
             leadingPriority: UILayoutPriority = .required,
             trailingPriority: UILayoutPriority = .required,
             bottomPriority: UILayoutPriority = .required) {
    let topConstraint: NSLayoutConstraint = topAnchor.constraint(equalTo: view.topAnchor)
    topConstraint.priority = topPriority
    let leadingConstraint: NSLayoutConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor)
    leadingConstraint.priority = leadingPriority
    let trailingConstraint: NSLayoutConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor)
    trailingConstraint.priority = trailingPriority
    let bottomConstraint: NSLayoutConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor)
    bottomConstraint.priority = bottomPriority
    NSLayoutConstraint.activate([
      topConstraint,
      leadingConstraint,
      trailingConstraint,
      bottomConstraint,
    ])
  }

  func edges(equalTo layoutGuide: UILayoutGuide,
             topPriority: UILayoutPriority = .required,
             leadingPriority: UILayoutPriority = .required,
             trailingPriority: UILayoutPriority = .required,
             bottomPriority: UILayoutPriority = .required) {
    let topConstraint: NSLayoutConstraint = topAnchor.constraint(equalTo: layoutGuide.topAnchor)
    topConstraint.priority = topPriority
    let leadingConstraint: NSLayoutConstraint = leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor)
    leadingConstraint.priority = leadingPriority
    let trailingConstraint: NSLayoutConstraint = trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor)
    trailingConstraint.priority = trailingPriority
    let bottomConstraint: NSLayoutConstraint = bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
    bottomConstraint.priority = bottomPriority
    NSLayoutConstraint.activate([
      topConstraint,
      leadingConstraint,
      trailingConstraint,
      bottomConstraint,
    ])
  }
}
