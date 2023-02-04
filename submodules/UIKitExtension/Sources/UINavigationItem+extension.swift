//
//  UINavigationItem+extension.swift
//
//  Copyright 2023 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit

public extension UINavigationItem {

  /// usage:
  ///
  /// ```
  /// public override func viewWillAppear(_ animated: Bool) {
  ///  super.viewWillAppear(animated)
  ///  guard navigationItem.leftBarButtonItem == nil else { return }
  ///  navigationItem.leftBarButtonItem = navigationItem.pseudo(self,
  ///																														action: #selector(tap),
  ///																														titles: [.normal: "HelloWorld!"])
  /// }
  ///
  /// @objc func tap(_ sender: UIBarButton) {
  ///  fatalError()
  /// }
  /// ```
  func system(_ target: Any?,
              action: Selector,
              titles: [UIControl.State: String?] = [:]) -> UIBarButtonItem {
    let systemBtn = UIButton(type: .system)
    systemBtn.addTarget(target, action: action, for: .touchUpInside)
    for (state, title) in titles {
      systemBtn.setTitle(title, for: state)
    }
    return UIBarButtonItem(customView: systemBtn)
  }

  func icon(_ target: Any?,
            action: Selector,
            names: [UIControl.State: String?] = [:]) -> UIBarButtonItem {
    let customBtn = UIButton(type: .custom)
    customBtn.addTarget(target, action: action, for: .touchUpInside)
    for (state, named) in names {
      if let named = named {
        customBtn.setImage(UIImage(named: named)?.withRenderingMode(.alwaysTemplate), for: state)
      } else {
        customBtn.setImage(nil, for: state)
      }
    }
    return UIBarButtonItem(customView: customBtn)
  }
}
