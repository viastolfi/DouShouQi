//
//  CellTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class CellTest: XCTestCase {

    func testDescription() {
        var cell = Cell(ofType: .jungle, ownedBy: .player1)
        XCTAssertEqual("ø on .jungle, 1", cell.description)
        cell = Cell(ofType: .den)
        XCTAssertEqual("ø on .den, x", cell.description)
        cell = Cell(ofType: .trap,  ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))
        XCTAssertEqual("[1:rat] on .trap, 1", cell.description)
    }
}
