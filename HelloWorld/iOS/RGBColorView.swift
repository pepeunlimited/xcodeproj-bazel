//
//  RGBColorView.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

final class RGBColorView: UIView {

  var columns: Int = 4

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
      hStack.bott∆omAnchor.constraint(equalTo: bottomAnchor),
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
    let hStack: UIStackView = UIStackView(frame: .zero, axis: .horizontal)
    vStack.addArrangedSubview(hStack)
    for _ in 0...columns - 1 {
      let view = UIView(frame: .zero,
                        translatesAutoresizingMaskIntoConstraints: false)
      view.backgroundColor = .red
      NSLayoutConstraint.activate([
        view.widthAnchor.constraint(equalToConstant: rgbViewSize.width),
        view.heightAnchor.constraint(equalToConstant: rgbViewSize.height),
      ])
      hStack.addArrangedSubview(view)
    }
  }
}

// MARK: RGBColorView+ComputedProperties

extension RGBColorView {

  var parentViewSize: CGSize {
    guard let size = superview?.frame.size else {
      return .zero
    }
    return size
  }

  var rgbViewSize: CGSize {
    let width: CGFloat = parentViewSize.width / CGFloat(columns)
    return CGSize(width: width, height: width)
  }
}
