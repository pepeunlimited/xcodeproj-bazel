//
//  OSLog+extension.swift
//  HelloWorld
//
//  Created by Simo Ala-Kotila on 5.8.2022.
//

import Foundation
import os

extension OSLog {

  private static var subsystem = Bundle.main.bundleIdentifier!

  static let app = OSLog(subsystem: subsystem, category: "app")

  static let app = OSLog(subsystem: subsystem, category: "scene")
}
