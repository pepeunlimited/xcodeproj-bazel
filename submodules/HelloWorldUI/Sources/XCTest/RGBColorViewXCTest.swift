//
//  HelloWorldXCTest.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import Foundation
import HelloWorldUI
import XCTest

final class RGBColorViewXCTest: XCTestCase {

  func testInitialLoad() throws {
    let rgbColorView: RGBColorView = RGBColorView(frame: .zero,
                                                  translatesAutoresizingMaskIntoConstraints: false)
    XCTAssertEqual(rgbColorView.columns, 5)
    XCTAssertEqual(rgbColorView.rows, 10)
    XCTAssertEqual(rgbColorView.contentViewSize, .zero)
    XCTAssertEqual(rgbColorView.rgbSize, .zero)
  }
}
