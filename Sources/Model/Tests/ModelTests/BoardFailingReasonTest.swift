//
//  BoardFailingReasonTest.swift
//  
//
//  Created by Vincent Astolfi on 17/01/2024.
//

import XCTest
@testable import Model

final class BoardFailingReasonTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEquatable() throws {
        XCTAssertEqual(BoardFailingReason.cellEmpty, BoardFailingReason.cellEmpty)
        XCTAssertEqual(BoardFailingReason.cellNotEmpty, BoardFailingReason.cellNotEmpty)
        XCTAssertEqual(BoardFailingReason.outOfBounds, BoardFailingReason.outOfBounds)
        XCTAssertEqual(BoardFailingReason.unknown, BoardFailingReason.unknown)
    }
}
