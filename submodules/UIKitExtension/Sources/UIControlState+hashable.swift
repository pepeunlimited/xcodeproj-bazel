//
//  UIControlState+hashable.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.

import Foundation
import UIKit

extension UIControl.State: Hashable {

  public var hashValue: Int {
    Int(rawValue)
  }
}
