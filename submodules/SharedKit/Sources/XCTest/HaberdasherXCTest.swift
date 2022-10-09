//
//  HelloWorldXCTest.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import SharedKit
import XCTest

final class HelloWorldXCTest: XCTestCase {

  func testExample() throws {
    let greeting: String = Haberdasher.shared.greeting
    XCTAssertEqual(greeting, "Hola")
  }
}
