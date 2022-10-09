//
//  RGBColorView.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import UIKit
import UIKitExtension

public final class RGBColorView: UIView {

  public var columns: Int = 5

  public var rows: Int = 10

  public var contentViewSize: CGSize = .zero

  let hStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .horizontal,
                                        alignment: .top,
                                        distribution: .fill)

  let vStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .vertical,
                                        alignment: .leading,
                                        distribution: .fill)

  public var schemes: [UIColor] = [
    UIColor.bblue,
    UIColor.wwhite,
    UIColor.bblack,
    UIColor.ccyan,
    UIColor.rred,
    UIColor.yyellow,
  ]

  // MARK: Initializer

  public override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
    addSubview(hStack)
    hStack.addArrangedSubview(vStack)
    NSLayoutConstraint.activate([
      hStack.topAnchor.constraint(equalTo: topAnchor),
      hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  required init(coder: NSCoder) {
    fatalError("not supported")
  }

  // MARK: Configure

  func configureView() {
    translatesAutoresizingMaskIntoConstraints = false
  }

  // MARK: Domain

  public func start(_ animated: Bool) {
    for _ in 0...rows - 1 {
      let hStack: UIStackView = UIStackView(frame: .zero, axis: .horizontal)
      vStack.addArrangedSubview(hStack)
      for _ in 0...columns - 1 {
        let rgbView: UIView = UIView(frame: .zero,
                                     translatesAutoresizingMaskIntoConstraints: false)
        let schemesCount: Int = schemes.count - 1
        let fromColor: UIColor = schemes[Int.random(in: 0...schemesCount)]
        let toColor: UIColor = schemes[Int.random(in: 0...schemesCount)]
        rgbView.backgroundColor = fromColor
        if animated {
          let animation: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
          animation.fromValue = fromColor.cgColor
          animation.toValue = toColor.cgColor
          animation.duration = 3
          animation.beginTime = CACurrentMediaTime()
          animation.repeatCount = .infinity
          animation.autoreverses = true
          rgbView.layer.add(animation, forKey: nil)
        }
        NSLayoutConstraint.activate([
          rgbView.widthAnchor.constraint(equalToConstant: rgbSize.width),
          rgbView.heightAnchor.constraint(equalToConstant: rgbSize.height),
        ])
        hStack.addArrangedSubview(rgbView)
      }
    }
  }
}

// MARK: RGBColorView+ComputedProperties

public extension RGBColorView {

  var rgbSize: CGSize {
    let width: CGFloat = contentViewSize.width / CGFloat(columns)
    let height: CGFloat = contentViewSize.height / CGFloat(rows)
    return CGSize(width: width, height: height)
  }
}

public extension RGBColorView {

  override var debugDescription: String {
    "RGBColorView rgbSize: \(rgbSize), columns: \(columns), rows: \(rows)"
  }
}
