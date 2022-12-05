//
//  FeedViewDelegate.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation

public protocol FeedViewDelegate: AnyObject {

  func feedView(_ feedView: FeedViewController, didSelectItem item: String, animated: Bool)
}
