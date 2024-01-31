//
//  BoardResultTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class BoardResultTest: XCTestCase {

    func testEquatable() throws {
        XCTAssertTrue(BoardResult.ok == BoardResult.ok)
        XCTAssertFalse(BoardResult.unknown == BoardResult.ok)
    }
}
