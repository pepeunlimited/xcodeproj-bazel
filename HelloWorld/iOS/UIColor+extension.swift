//
//  UIColor+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

extension UIColor {

  convenience init<T: BinaryInteger>(r: T, g: T, b: T, a: T = 255) {
    self.init(red: .init(r)/255,
              green: .init(g)/255,
              blue: .init(b)/255,
              alpha: .init(a)/255)
  }

  static var bblue: UIColor {
    UIColor.init(r: 1, g: 22, b: 39)
  }

  static var wwhite: UIColor {
    UIColor.init(r: 253, g: 255, b: 252)
  }

  static var bblack: UIColor {
    UIColor.init(r: 11, g: 9, b: 10)
  }

  static var ccyan: UIColor {
    UIColor.init(r: 46, g: 196, b: 182)
  }

  static var rred: UIColor {
    UIColor.init(r: 231, g: 29, b: 54)
  }

  static var yyellow: UIColor {
    UIColor.init(r: 255, g: 159, b: 28)
  }
}
