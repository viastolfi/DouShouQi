//
//  OwnerTest.swift
//  
//
//  Created by Vincent Astolfi on 16/01/2024.
//

import XCTest
@testable import Model

final class OwnerTest: XCTestCase {

    func testGetOtherPlayer() {
        XCTAssertEqual(Owner.player1, Owner.getOtherPlayer(.player2))
        XCTAssertEqual(Owner.player2, Owner.getOtherPlayer(.player1))
    }

    func testCustomStringConvertibleDescription() throws {
        XCTAssertEqual(Owner.noOne.description, "x")
        XCTAssertEqual(Owner.player1.description, "1")
        XCTAssertEqual(Owner.player2.description, "2")
    }
}
