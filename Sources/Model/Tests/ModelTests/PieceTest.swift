//
//  PieceTest.swift
//  
//
//  Created by Vincent Astolfi on 16/01/2024.
//

import XCTest
@testable import Model

final class PieceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var piece_description = Piece(withOwner: .player1, andAnimal: .dog).description
        XCTAssertEqual(piece_description, "[1:dog]")
        
        piece_description = Piece(withOwner: .player2, andAnimal: .cat).description
        XCTAssertEqual(piece_description, "[2:cat]")
        
        piece_description = Piece(withOwner: .noOne, andAnimal: .wolf).description
        XCTAssertEqual(piece_description, "[x:wolf]")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
