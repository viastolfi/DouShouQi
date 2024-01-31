//
//  StringExtensionTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class StringExtensionTest: XCTestCase {

    func testIsNumber() throws {
        XCTAssertTrue("2".isNumber)
        XCTAssertFalse("HAAA".isNumber)
        XCTAssertTrue("234".isNumber)
    }
}
