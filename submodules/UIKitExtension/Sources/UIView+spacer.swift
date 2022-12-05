//
//  UIView+spacer.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UIView {

  static func spacer(size: CGFloat = .greatestFiniteMagnitude,
                     axis: NSLayoutConstraint.Axis = .horizontal) -> UIView {
    let spacer: UIView = UIView(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)
    switch axis {
    case .horizontal:
      let constraint = spacer.widthAnchor.constraint(equalToConstant: size)
      constraint.priority = .defaultLow
      constraint.isActive = true
      return spacer
    case .vertical:
      let constraint = spacer.heightAnchor.constraint(equalToConstant: size)
      constraint.priority = .defaultLow
      constraint.isActive = true
      return spacer
    @unknown default:
      return UIView.spacer(axis: .horizontal)
    }
  }
}
