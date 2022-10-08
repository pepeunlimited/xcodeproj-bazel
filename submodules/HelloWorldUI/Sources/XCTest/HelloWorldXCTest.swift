//
//  HelloWorldXCTest.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import XCTest

public final class HelloWorldXCTest: XCTestCase {

    public func testEnv() throws {
        let variable1: String? = ProcessInfo.processInfo.environment["VARIABLE_1"] as String?
        let variable2: String? = ProcessInfo.processInfo.environment["VARIABLE_2"] as String?
        XCTAssertEqual(variable1, "Something1")
        XCTAssertEqual(variable2, "Something2")
    }
}
