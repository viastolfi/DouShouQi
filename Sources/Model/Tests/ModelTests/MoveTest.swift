//
//  MoveTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class MoveTest: XCTestCase {

    func testDescription() throws {
        let expectedString = "1 move from (0, 0) to (1, 1)"
        let move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 1)
        XCTAssertEqual(expectedString, move.description)
    }
}
