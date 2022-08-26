//
//  UIStackView+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

extension UIStackView {

  convenience init(frame: CGRect,
                   axis: NSLayoutConstraint.Axis,
                   isLayoutMarginsRelativeArrangement: Bool = true,
                   alignment: UIStackView.Alignment = .fill,
                   distribution: UIStackView.Distribution = .fill,
                   translatesAutoresizingMaskIntoConstraints: Bool = false) {
    self.init(frame: frame)
    self.axis = axis
    self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
    self.alignment = alignment
    self.distribution = distribution
    self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
  }
}
