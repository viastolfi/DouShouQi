//
//  VerySimpleRulesTest.swift
//  
//
//  Created by Vincent Astolfi on 24/01/2024.
//

import XCTest
@testable import Model

final class VerySimpleRulesTest: XCTestCase {
    
    private var rules: VerySimpleRules!
    private var board: Board!
    override func setUpWithError() throws {
        rules = VerySimpleRules()
        board = VerySimpleRules.createBoard()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testcheckBoard() throws {
        var board = Board(withGrid: [[Cell(ofType: .jungle), Cell(ofType: .trap)], [Cell(ofType: .den), Cell(ofType: .water)]])!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(board)) { error in
            XCTAssertEqual(error as! InvalidBoardError, InvalidBoardError.badDimensions(row: 2, column: 2))
        }
        
        let piece = Piece(withOwner: .noOne, andAnimal: .cat)
        board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: piece),
                Cell(ofType: .den, ownedBy: .player1),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .tiger)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .elephant))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .elephant)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .rat))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .tiger)),
                Cell(ofType: .den, ownedBy: .player2),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
                Cell(ofType: .jungle)
            ]
        ])!
        
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(board)) { error in
            XCTAssertEqual(error as! InvalidBoardError, InvalidBoardError.pieceWithNoOwner(piece: piece))
        }
        
        XCTAssertNoThrow(try VerySimpleRules.checkBoard(self.board))
    }

    func testCreateBoard() throws {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                Cell(ofType: .den, ownedBy: .player1),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .tiger)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .elephant))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .elephant)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .rat))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .tiger)),
                Cell(ofType: .den, ownedBy: .player2),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
                Cell(ofType: .jungle)
            ]
        ])
        
        XCTAssertEqual(VerySimpleRules.createBoard(), board)
    }
    
    func testIsMoveValid() throws {
        var move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 1, rowDestination: 1, columnDestination: 1)
        XCTAssertTrue(rules.isMoveValid(board, move))
        move = Move(owner: .noOne, rowOrigin: 0, columnOrigin: 1, rowDestination: 1, columnDestination: 1)
        XCTAssertFalse(rules.isMoveValid(board, move))
    }
    
    func testGetMoves() throws {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
            ],
        ])
        
        let moves = [Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 0, columnDestination: 1), Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 1, columnDestination: 0), Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 1, columnDestination: 2), Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 2, columnDestination: 1)]
        
        let sMoves = Set(moves)
        let resultSMoves = Set(rules.getMoves(board!, .player1))
        
        XCTAssertEqual(sMoves, resultSMoves)
    }
    
    func testIsGameOver() throws {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .den, ownedBy: .player2, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
            ],
        ])
        
        let res = rules.isGameOver(onBoard: board!, afterMoveRow: 0, andColumn: 1)
        XCTAssertTrue(res.0)
        XCTAssertEqual(Result.winner(winner: .player1, reason: .denReached), res.1)
    }
    
    func testPlayedMove() throws {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .den, ownedBy: .player2),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
            ],
        ])!
        
        XCTAssertEqual(0, rules.historic.count)
        rules.playedMove(move: Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 0, columnDestination: 1), originalBoard: board, afterMoveBoard: board)
        XCTAssertEqual(1, rules.historic.count)
    }
    
    func testGetNextPlayer() throws {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .den, ownedBy: .player2),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
            ],
        ])!
        
        rules.playedMove(move: Move(owner: .player1, rowOrigin: 1, columnOrigin: 1, rowDestination: 0, columnDestination: 1), originalBoard: board, afterMoveBoard: board)
        XCTAssertEqual(Owner.player2, rules.getNextPlayer())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
