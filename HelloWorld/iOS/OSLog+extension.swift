//
//  OSLog+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os

extension OSLog {

  private static var subsystem: String = Bundle.main.bundleIdentifier!

  static let app: OSLog = OSLog(subsystem: subsystem, category: "app")

  static let scene: OSLog = OSLog(subsystem: subsystem, category: "scene")
}
