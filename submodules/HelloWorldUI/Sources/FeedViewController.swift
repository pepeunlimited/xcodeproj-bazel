//
//  FeedViewDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os
import UIKit
import UIKitExtension

/// - [`finding-and-refactoring-code`](https://developer.apple.com/documentation/xcode/finding-and-refactoring-code)
/// - [`enum-driven-tableview-development`](https://www.raywenderlich.com/5542-enum-driven-tableview-development)
/// - [`reusable-data-sources-in-swift`](https://www.swiftbysundell.com/articles/reusable-data-sources-in-swift/)
/// - [`uitableview`](https://matteomanferdini.com/uitableview/)
/// - [`uitableview-sections-with-nested-types`](https://betterprogramming.pub/uitableview-sections-with-nested-types-27eabb833ad9)
/// - [`better-form-architecture-for-ios-applications`](https://nimblehq.co/blog/better-form-architecture-for-ios-applications)
/// - [`uitableviewheaderfooterview`](https://nshipster.com/uitableviewheaderfooterview/)
/// - [`swift-associated-types-self-requirements`](https://khawerkhaliq.com/blog/swift-associated-types-self-requirements)
/// - [`new-api-client`](https://kean.blog/post/new-api-client)
/// - [`how-to-declare-network-error-with-enum-in-swift`](https://onmyway133.com/posts/how-to-declare-network-error-with-enum-in-swift)
/// - [`how-to-resolve-keywindow-was-deprecated-in-ios-13-0`](https://stackoverflow.com/questions/57134259/how-to-resolve-keywindow-was-deprecated-in-ios-13-0)
/// - [`topMostViewController.swift`](https://gist.github.com/db0company/369bfa43cb84b145dfd8?permalink_comment_id=2642874)
/// - [`Reference to currently active window`](https://developer.apple.com/forums/thread/695115)
/// - [`How to add view to current view controller from function outside the class/file?`](https://developer.apple.com/forums/thread/62108)
/// - [`Advances in UI Data Sources`](https://developer.apple.com/videos/play/wwdc2019/220/)
/// - [`TryLotusMVC`](https://github.com/hlung/Lotus-MVC-example/blob/master/TryLotusMVC)
/// - [`snips`](https://www.swiftjectivec.com/snips)
public final class FeedViewController: UIViewController {

  static let elementKindUITableCell: String = "elementKindUITableCell"

  let tableView: UITableView = UITableView(frame: .zero, translatesAutoresizingMaskIntoConstraints: false)

  public var delegate: FeedViewDelegate?

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    os_log("[FeedViewController.swift] >> viewDidLoad", log: OSLog.viewCycle, type: .debug)
    configureNavigationBar()
    configureTableView()
    configureView()
  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    os_log("[FeedViewController.swift] >> viewWillAppear", log: OSLog.viewCycle, type: .debug)
    // deselect the current selection
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
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
    title = "Feed View"
  }

  func configureTableView() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: FeedViewController.elementKindUITableCell)
  }

}

// [`SWIFT: UITableView sections example`](https://gist.github.com/licvido/a78f3714a7eda01b3c62)
// MARK: 

extension FeedViewController: UITableViewDelegate {

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // tableView.deselectRow(at: indexPath, animated: true)
    delegate?.feedView(self, didSelectItem: "asdad", animated: true)
  }

}

extension FeedViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewController.elementKindUITableCell,
                                             for: indexPath) as UITableViewCell
    cell.textLabel?.text = "Row \(indexPath.row)"
    // cell.selectionStyle = .none
    return cell
  }
}

// MARK: FeedViewController

extension FeedViewController {

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

}
