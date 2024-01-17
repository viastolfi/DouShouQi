//
//  OwnerTest.swift
//  
//
//  Created by Vincent Astolfi on 16/01/2024.
//

import XCTest
@testable import Model

final class OwnerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCustomStringConvertibleDescription() throws {
        XCTAssertEqual(Owner.noOne.description, "x")
        XCTAssertEqual(Owner.player1.description, "1")
        XCTAssertEqual(Owner.player2.description, "2")
    }
}
