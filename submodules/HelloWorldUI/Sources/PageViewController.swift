//
//  PageViewController.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import OSExtension
import UIKit
import UIKitExtension

public final class PageViewController: UIViewController {

  public var viewControllers: [UIViewController] = []

  let pageViewController: UIPageViewController = UIPageViewController(transitionStyle: .scroll,
                                                                      navigationOrientation: .horizontal,
                                                                      options: [:])

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    os_log("PageViewController.swift >> viewDidLoad",
           log: OSLog.viewCycle,
           type: .debug)
    configureView()
    configureNavigationBar()
    configureUIPageViewController()
    configureUIPageViewControllerContent()
    configureUIPageViewControllerStyle()
    configureControls()
  }

  // MARK: UIPageViewController: Setup the child view controller

  func configureUIPageViewController() {
    // add as child view controller
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    NSLayoutConstraint.activate([
      pageViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      pageViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      pageViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      pageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    pageViewController.didMove(toParent: self)
    // configure data source
    pageViewController.dataSource = self
    // configure delegate
    pageViewController.delegate = self
  }

  // MARK: UIPageViewController: Setup the content for the child view controller

  func configureUIPageViewControllerContent() {
    if let vc = viewControllers.first {
      pageViewController.setViewControllers([vc], direction: .forward, animated: true) { [weak self] finished in
        guard let weakSelf = self else { return }
        os_log("PageViewController.swift >> page-turn animation completed: finished=%{bool}d",
               log: OSLog.viewCycle,
               type: .debug,
               finished)
      }
    } else {
      // nothing to display..
      os_log("PageViewController.swift >> nothing to display..", log: OSLog.viewCycle, type: .debug)
    }
  }

  // MARK: UIPageViewController: Setup the style of it

  func configureUIPageViewControllerStyle() {
    // configure pageControl colors
    pageViewController.pageControl.pageIndicatorTintColor = pageIndicatorTintColor
    pageViewController.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
  }

  func configureView() {
    view.backgroundColor = backgroundColor
  }

  func configureNavigationBar() {
    if #available(iOS 15, *) {
      // @see https://developer.apple.com/forums/thread/682420
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = backgroundColor                        // navigation background color
      appearance.titleTextAttributes = [.foregroundColor: textColor]      // title text color
      appearance.largeTitleTextAttributes = [.foregroundColor: textColor] // title text color
      navigationController?.navigationBar.standardAppearance = appearance
      navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    } else {
      navigationController?.navigationBar.backgroundColor = backgroundColor // navigation background color
      navigationController?.navigationBar.tintColor = textColor             // title text color
    }
    title = "Page View"
  }

  // MARK: Programmatically control the swipe

  func configureControls() {
    // configure container
    let hStack: UIStackView = UIStackView(frame: .zero,
                                          axis: .horizontal,
                                          alignment: .leading,
                                          distribution: .fill)
    view.addSubview(hStack)
    NSLayoutConstraint.activate([
      hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      hStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    // back-btn
    let backBtn: UIButton = UIButton(type: .system)
    backBtn.translatesAutoresizingMaskIntoConstraints = false
    backBtn.setTitle("Back", for: .normal)
    backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
    hStack.addArrangedSubview(backBtn)
    // next-btn
    let nextBtn: UIButton = UIButton(type: .system)
    nextBtn.translatesAutoresizingMaskIntoConstraints = false
    nextBtn.setTitle("Next", for: .normal)
    nextBtn.addTarget(self, action: #selector(nextBtnClick), for: .touchUpInside)
    hStack.addArrangedSubview(nextBtn)
  }

  @objc func backBtnClick(_ sender: UIButton) {
    let previousVC = viewControllers[previousIndex]
    pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true)
  }

  @objc func nextBtnClick(_ sender: UIButton) {
    let nextVC = viewControllers[nextIndex]
    pageViewController.setViewControllers([nextVC], direction: .forward, animated: true)
  }
}

extension PageViewController {

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

  var textColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .white
        } else {
          return .black
        }
      }
    } else {
      return .white
    }
  }

  var pageIndicatorTintColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .systemGray2
        } else {
          return .systemGray4
        }
      }
    } else {
      return .systemGray
    }
  }

  var currentPageIndicatorTintColor: UIColor {
    if #available(iOS 13, *) {
      return UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
          return .white
        } else {
          return .black
        }
      }
    } else {
      return .black
    }
  }

  // Helper computed values for the pageViewController

  var currentIndex: Int {
    guard let currentVC = currentViewController else { return 0 }
    guard let currentIndex = viewControllers.firstIndex(where: { $0 == currentVC }) else { return 0 }
    return currentIndex
  }

  var nextIndex: Int {
    var nextIndex = currentIndex
    nextIndex += 1
    if nextIndex > viewControllers.count - 1 {
      return self.currentIndex
    }
    return nextIndex
  }

  var previousIndex: Int {
    var previousIndex = currentIndex
    previousIndex -= 1
    if previousIndex < 0 {
      return self.currentIndex
    }
    return previousIndex
  }

  var currentViewController: UIViewController? {
    guard let currentVC = pageViewController.viewControllers?.first else { return nil }
    return currentVC
  }
}

// MARK: PageViewController: UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {

  // paginates `previous` view controller e.g. index -= 1
  public func pageViewController(_ pageViewController: UIPageViewController,
                                 viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard var previousIndex = viewControllers.firstIndex(where: { $0 == viewController }) else { return nil }
    os_log("PageViewController+UIPageViewControllerDataSource.swift >> pageViewController: viewControllerBefore: %ld",
           log: OSLog.viewCycle,
           type: .debug,
           previousIndex)
    previousIndex -= 1
    if previousIndex < 0 {
      return nil
    }
    return viewControllers[previousIndex]
  }

  // paginates `next` view controller e.g. index += 1
  public func pageViewController(_ pageViewController: UIPageViewController,
                                 viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard var nextIndex = viewControllers.firstIndex(where: { $0 == viewController }) else { return nil }
    os_log("PageViewController+UIPageViewControllerDataSource.swift >> pageViewController: viewControllerAfter: %ld",
           log: OSLog.viewCycle,
           type: .debug,
           nextIndex)
    nextIndex += 1
    if nextIndex > viewControllers.count - 1 {
      return nil
    }
    return viewControllers[nextIndex]
  }

  // presentationCount and presentationIdex are required for the pageIndicator

  public func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return viewControllers.count
  }

  public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    os_log("PageViewController+UIPageViewControllerDataSource.swift >> presentationIndex: currentVC: %@, currentIndex: %ld",
           log: OSLog.viewCycle,
           type: .debug,
           String(describing: currentViewController),
           currentIndex)
    return currentIndex
  }
}

// MARK: PageViewController: UIPageViewControllerDelegate

extension PageViewController: UIPageViewControllerDelegate {

  public func pageViewController(_ pageViewController: UIPageViewController,
                                 didFinishAnimating finished: Bool,
                                 previousViewControllers: [UIViewController],
                                 transitionCompleted completed: Bool) {
    os_log("PageViewController+UIPageViewControllerDelegate.swift >> pageViewController: didFinishAnimating: %{bool}, currentViewController: %@",
           log: OSLog.viewCycle,
           type: .debug,
           finished,
           String(describing: currentViewController))
  }
}
