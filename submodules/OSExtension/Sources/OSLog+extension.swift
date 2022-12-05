//
//  OSLog+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import os

public extension OSLog {

  private static var subsystem: String = Bundle.main.bundleIdentifier!

  static let app: OSLog = OSLog(subsystem: subsystem, category: "app")

  static let scene: OSLog = OSLog(subsystem: subsystem, category: "scene")

  static let viewCycle: OSLog = OSLog(subsystem: subsystem, category: "viewCycle")

  static let rgbView: OSLog = OSLog(subsystem: subsystem, category: "rgbView")

  static let coordinator: OSLog = OSLog(subsystem: subsystem, category: "coordinator")

  static let tableView: OSLog = OSLog(subsystem: subsystem, category: "tableView")
}
