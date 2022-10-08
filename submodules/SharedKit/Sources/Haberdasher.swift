//
//  Haberdasher.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation

public final class Haberdasher {

  public static let shared: Haberdasher = {
    let instance: Haberdasher = Haberdasher()
    return instance
  }()

  public var greeting: String {
    "Hola"
  }

  public func makeHat(_ size: Int) -> String {
    "inches: \(size), color: invisible, name: bowler"
  }

  // let variable2: String? = ProcessInfo.processInfo.environment["VARIABLE_2"] as String?


}
