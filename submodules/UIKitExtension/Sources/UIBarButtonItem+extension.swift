//
//  UIBarButtonItem+extension.swift
//
//  Copyright 2023 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UIBarButtonItem {

  /// usage:
  ///
  /// ```
  /// public override func viewWillAppear(_ animated: Bool) {
  ///  super.viewWillAppear(animated)
  ///  guard navigationItem.leftBarButtonItem == nil else { return }
  ///  navigationItem.leftBarButtonItem = UIBarButtonItem(self,
  ///																											action: #selector(tap),
  ///																											titles: [.normal: "HelloWorld!"])
  ///  navigationItem.rightBarButtonItem = UIBarButtonItem(self,
  ///																											 action: #selector(tap),
  ///																											 type: .custom,
  ///																											 names: ["bazel"])
  /// }
  ///
  /// @objc func tap(_ sender: UIBarButton) {
  ///  fatalError()
  /// }
  /// ```
  ///
  /// parameters:
  ///						- target: self
  /// 					- action: #selector(tap)
  /// 					- type: button type
  ///						- rendering: .alwaysTemplate (icons), .alwaysOringal(images)
  ///           - fixedSize: fixedSize
  /// 					- titles: titles for the button
  /// 					- names:  resources for images
  convenience init(_ target: Any?,
                   action: Selector,
                   type: UIButton.ButtonType = .system,
                   rendering: UIImage.RenderingMode = .alwaysTemplate,
                   fixedSize: CGSize? = nil,
                   titles: [UIControl.State: String?] = [:],
                   names: [UIControl.State: String?] = [:]) {
    let btn = UIButton(type: type)
    btn.addTarget(target, action: action, for: .touchUpInside)
    // set titles for the button
    for (state, title) in titles {
      btn.setTitle(title, for: state)
    }
    // set resource names for the button
    for (state, named) in names {
      if let named, let fixedSize = fixedSize {
        btn.setImage(UIImage(named: named)?.fixedSize(fixedSize)?.withRenderingMode(rendering), for: state)
      } else if let named = named {
        btn.setImage(UIImage(named: named)?.withRenderingMode(rendering), for: state)
      } else {
        btn.setImage(nil, for: state)
      }
    }
    self.init(customView: btn)
  }
}
