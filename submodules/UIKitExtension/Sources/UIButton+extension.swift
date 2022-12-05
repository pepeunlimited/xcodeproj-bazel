//
//  UIButton+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UIButton {

  func setBackgroundColor(_ color: UIColor?,
                          cornerRadius: CGFloat = 8.0,
                          for state: UIControl.State) {
    // check the color
    guard let color = color else {
      setBackgroundImage(nil, for: state)
      return
    }
    // check the cornerRadius
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
    layer.maskedCorners = [
      .layerMinXMinYCorner,
      .layerMaxXMinYCorner,
      .layerMinXMaxYCorner,
      .layerMaxXMaxYCorner,
    ]
    // create one pixel of the rect
    let rect = CGRect(origin: .zero, size: CGSize(width: CGFloat(1.0), height: CGFloat(1.0)))
    var backgroundImage = UIGraphicsImageRenderer(size: rect.size).image { (_) in
      // Fill the square with the black color for later tinting.
      color.setFill()
      UIBezierPath(roundedRect: rect, cornerRadius: .zero).fill()
    }
    // Apply the `color` to the `backgroundImage` as a tint color
    // so that the `backgroundImage` can update its color automatically when the currently active traits are changed.
    if #available(iOS 13.0, *) {
      backgroundImage = backgroundImage.withTintColor(color, renderingMode: .alwaysOriginal)
    }
    setBackgroundImage(backgroundImage, for: state)
  }
}
