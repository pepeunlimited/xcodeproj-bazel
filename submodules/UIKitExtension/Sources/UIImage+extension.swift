//
//  UIImage+extension.swift
//
//  Copyright 2023 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UIImage {

  func fixedSize(_ size: CGSize) -> UIImage? {
    let frame = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
    draw(in: frame)
    let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    withRenderingMode(.alwaysOriginal)
    return resizedImage
  }
}
