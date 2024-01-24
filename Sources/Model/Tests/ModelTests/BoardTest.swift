//
//  BoardTest.swift
//  
//
//  Created by Vincent Astolfi on 16/01/2024.
//

import XCTest
@testable import Model

final class BoardTest: XCTestCase {
    private var board: Board!
    
    override func setUpWithError() throws {
        self.board = Board(withGrid: [
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .den),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .tiger))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .dog)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .leopard)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .wolf)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .elephant))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .elephant)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .wolf)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .leopard)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .rat)),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .dog)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .tiger)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .den),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
            ]
        ])!    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializer() throws {
        XCTAssert(self.board.nbColumns == 7)
        XCTAssert(self.board.nbRows == 10)
    }
    
    func testNilInitializer() throws {
        var result = Board(withGrid: [])
        XCTAssertNil(result)
        result = Board(withGrid: [[]])
        XCTAssertNil(result)
        result = Board(withGrid: [[Cell(ofType: .den), Cell(ofType: .jungle)], [Cell(ofType: .trap)]])
        XCTAssertNil(result)
    }
    
    func testCountPieces() throws {
        XCTAssert(self.board.countPieces(of: .player1) == 8)
        XCTAssert(self.board.countPieces(of: .player2) == 8)
        XCTAssert(self.board.countPieces() == (8, 8))
    }
    
    func testRemovePieces() throws {
        var result = self.board.remove(atRow: 20, atColumn: 20)
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
        result = self.board.remove(atRow: 0, atColumn: 0)
        XCTAssertEqual(result, .ok)
        result = self.board.remove(atRow: 0, atColumn: 0)
        XCTAssertEqual(result, .failed(reason: .cellEmpty))
    }
    
    func testInsertPieces() throws {
        var result = self.board.insert(piece: Piece(withOwner: .player1, andAnimal: .cat), atRow: 20, atColumn: 20)
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
        result = self.board.insert(piece: Piece(withOwner: .player1, andAnimal: .cat), atRow: 0, atColumn: 1)
        XCTAssertEqual(result, .ok)
        result = self.board.insert(piece: Piece(withOwner: .player1, andAnimal: .cat), atRow: 0, atColumn: 1)
        XCTAssertEqual(result, .failed(reason: .cellNotEmpty))
    }

    func testPerformanceInsertPiece() throws {
        self.measure {
            _ = self.board.insert(piece: Piece(withOwner: .player1, andAnimal: .cat), atRow: 0, atColumn: 1)
        }
    }

}
