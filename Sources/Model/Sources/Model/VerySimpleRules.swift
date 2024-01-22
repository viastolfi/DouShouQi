//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public struct VerySimpleRules: Rules{    
    public var occurences: [Board : Int]
    
    public var historic: [Move]
    
    public static func createBoard() -> Board {
        let board = Board(withGrid: [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                Cell(ofType: .den),
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
                Cell(ofType: .den),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
                Cell(ofType: .jungle)
            ]
        ])
        
        do {
            try checkBoard(board!)
            return board!
        } catch InvalidBoardError.pieceWithNoOwner(let piece) {
            // TODO
        } catch InvalidBoardError.badDimensions(let row,let column) {
            // TODO
        } catch {
            // TODO
        }
    }
    
    public static func checkBoard(_ board: Board) throws {
        guard board.nbRows == board.nbColumns else {
            throw InvalidBoardError.badDimensions(row: board.nbRows, column: board.nbColumns)
        }
        
        var pieceWithoutOwner = board.grid.checkIfPieceAsOwner()
        guard pieceWithoutOwner.result else {
            throw InvalidBoardError.pieceWithNoOwner(piece: pieceWithoutOwner.wrongPieces!)
        }
    }
    
    public func getNextPlayer() -> Owner {
        historic.last?.owner == .player1 ? .player2 : .player1
    }
    
    public func getMoves(_ board: Board, _ owner: Owner) -> Array<Move> {
        <#code#>
    }
    
    public func getMoves(_ board: Board, _ owner: Owner, originRow row: Int, originColumn column: Int) -> Array<Move> {
        <#code#>
    }
    
    public func isMoveValid(_ board: Board, originRow: Int, originColumn: Int, destinationRow: Int, destinationColumn: Int) -> Bool {
        <#code#>
    }
    
    public func isMoveValid(_ board: Board, _ move: Move) -> Bool {
        <#code#>
    }
    
    public func isGameOver(_ board: Board, _ row: Int, _ column: Int) -> (Bool, Result) {
        <#code#>
    }
    
    public mutating func playedMove(_ move: Move, originalBoard: Board, afterMoveBoard: Board) {
        historic.append(move)
    }
    
    
}
