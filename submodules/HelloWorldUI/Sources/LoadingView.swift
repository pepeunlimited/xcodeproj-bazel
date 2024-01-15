//
//  LoadingView.swift
//
//  Copyright 2023 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import UIKit
import UIKitExtension

// MARK: LoadingView

public final class LoadingView: UIView {

  let hStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .horizontal,
                                        alignment: .center,
                                        distribution: .fill)

  let vStack: UIStackView = UIStackView(frame: .zero,
                                        axis: .vertical,
                                        alignment: .center,
                                        distribution: .fill)

  let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    // configure indicator
    if #available(iOS 13, *) {
      activityIndicator.style = .medium
    }
    activityIndicator.color = indicatorColor
    activityIndicator.startAnimating()
    addSubview(hStack)
    hStack.edges(equalTo: self)
    hStack.addArrangedSubview(vStack)
    vStack.addArrangedSubview(activityIndicator)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("not supported")
  }

  func configureActivityIndicator() {
  }
}

// MARK: LoadingView + extension

extension LoadingView {

  // MARK: UIColors

  var indicatorColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .white
        } else {
          return .gray
        }
      }
    } else {
      return .gray
    }
  }
}

// MARK: LoadingViewController

public final class LoadingViewController: UIViewController {

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("not supported")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = backgroundColor
    let loadingView = LoadingView(frame: .zero,
                                  translatesAutoresizingMaskIntoConstraints: false)
    loadingView.backgroundColor = backgroundColor
    view.addSubview(loadingView)
    loadingView.edges(equalTo: view.safeAreaLayoutGuide)
  }
}

// MARK: LoadingViewController + extension

extension LoadingViewController {

  // MARK: UIColors

  var backgroundColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .black
        } else {
          return .white
        }
      }
    } else {
      return .black
    }
  }
}
