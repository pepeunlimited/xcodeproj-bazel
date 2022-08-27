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

final class RGBColorView: UIView {

  var columns: Int = 4

  var rows: Int = 8

  var contentViewSize: CGSize = .zero

  let hStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .horizontal,
                                        alignment: .top,
                                        distribution: .fill)

  let vStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .vertical,
                                        alignment: .leading,
                                        distribution: .fill)

  // MARK: Initializer

  override init(frame: CGRect) {
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

  func start(_ animated: Bool) {
    for _ in 0...rows - 1 {
      let hStack: UIStackView = UIStackView(frame: .zero, axis: .horizontal)
      vStack.addArrangedSubview(hStack)
      for _ in 0...columns - 1 {
        let view = UIView(frame: .zero,
                          translatesAutoresizingMaskIntoConstraints: false)
        view.backgroundColor = UIColor.schemes[Int.random(in: 0...5)]
        NSLayoutConstraint.activate([
          view.widthAnchor.constraint(equalToConstant: rgbSize.width),
          view.heightAnchor.constraint(equalToConstant: rgbSize.height),
        ])
        hStack.addArrangedSubview(view)
      }
    }
  }
}

// MARK: RGBColorView+ComputedProperties

extension RGBColorView {

  var rgbSize: CGSize {
    let width: CGFloat = contentViewSize.width / CGFloat(columns)
    let height: CGFloat = contentViewSize.height / CGFloat(rows)
    return CGSize(width: width, height: height)
  }
}

extension RGBColorView {

  override var debugDescription: String {
    "RGBColorView rgbSize: \(rgbSize), columns: \(columns), rows: \(rows)"
  }
}
