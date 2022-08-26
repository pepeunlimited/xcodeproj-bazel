//
//  UIView+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

extension UIView {

  convenience init(frame: CGRect,
                   translatesAutoresizingMaskIntoConstraints: Bool = false) {
    self.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
  }
}
