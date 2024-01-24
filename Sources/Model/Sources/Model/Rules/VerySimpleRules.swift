//
//  VerySimpleRules.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public struct VerySimpleRules: Rules{
    public var occurences: [Board : Int]
    public var historic: [Move]
    
    public init() {
        occurences = [:]
        historic = []
    }
    
    /// Create a board that correspond to very simple rules
    /// - Returns: The board or nil if there is an exception
    public static func createBoard() -> Board? {
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
        
        if let board {
            do {
                try checkBoard(board)
                return board
            }
            catch {
                return nil
            }
        }
        return nil
    }
    
    /// Check if a board is usable in the very simple rules context
    /// - Parameter board: The board we want to test
    public static func checkBoard(_ board: Board) throws {
        guard board.nbRows == 5 && board.nbColumns == 5 else {
            throw InvalidBoardError.badDimensions(row: board.nbRows, column: board.nbColumns)
        }
        
        var piecesOccurencies = Set<Piece>()
        let exceptionCells: Array<(CellType, (Int, Int))> = [(.den, (0, 2)),(.den,(4, 2))]
        
        for i in 0..<board.nbRows {
            for j in 0..<board.nbColumns {
                let cell = board.grid[i][j]
                if let piece = cell.piece {
                    if !piecesOccurencies.insert(piece).inserted {
                        throw InvalidBoardError.multipleOccurenceOfSamePiece(piece: piece)
                    }
                    if piece.owner == .noOne {
                        throw InvalidBoardError.pieceWithNoOwner(piece: piece)
                    }
                    if cell.initialOwner == piece.owner && cell.cellType == .den {
                        throw InvalidBoardError.pieceNotAllowedOnThisCell(piece: piece, cell: cell)
                    }
                }
                
                if let cellType = exceptionCells.getCellTypeWithCoordinates((i, j)) {
                    guard cell.cellType == cellType else {
                        throw InvalidBoardError.badCellType(cellType: cellType, row: i, column: j)
                    }
                }
                else {
                    guard cell.cellType == .jungle else {
                        throw InvalidBoardError.badCellType(cellType: cell.cellType, row: i, column: j)
                    }
                }
            }
        }
    }
    
    /// Get the next player who plays
    /// - Returns: A player betwenn the different owner enum
    public func getNextPlayer() -> Owner {
        (historic.last?.owner == .player1 ? .player2 : .player1) ?? .noOne
    }
    
    /// Get all the possible moves for an owner
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - owner: The owner we want to know the moves he cas do
    /// - Returns: An array of all the possible moves
    public func getMoves(_ board: Board, _ owner: Owner) -> Array<Move> {
        var moves: Array<Move> = []
                
        for row in 0..<board.nbRows {
            for column in 0..<board.nbColumns {
                moves += getMoves(board, owner, originRow: row, originColumn: column)
            }
        }
        
        return moves
    }
    
    /// Get all the possible moves from a origin cell
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - owner: The owner of the piece
    ///   - row: The original row we are moving from
    ///   - column: The original column we are moving from
    /// - Returns: An array of all the possible move
    public func getMoves(_ board: Board, _ owner: Owner, originRow row: Int, originColumn column: Int) -> Array<Move> {
        var moves: Array<Move> = []
        
        let possibleMove = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        guard let piece = board.grid[row][column].piece else { return moves }
        guard piece.owner == owner else { return moves }

        for coordinates in possibleMove {
            let move = Move(owner: owner, rowOrigin: row, columnOrigin: column, rowDestination: row + coordinates.0, columnDestination: column + coordinates.1)
            if isMoveValid(board, move) {
                moves.append(move)
            }
        }
        
        return moves
    }
    
    /// Check is a moove is valid or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - originRow: The origin row of the move
    ///   - originColumn: The origin column of the move
    ///   - destinationRow: The destination row of the move
    ///   - destinationColumn: The destination column of the move
    /// - Returns: A boolean indicating either the move is possible or not
    public func isMoveValid(_ board: Board, originRow: Int, originColumn: Int, destinationRow: Int, destinationColumn: Int) -> Bool {
        guard let piece = board.grid[originRow][originColumn].piece else {
            return false
        }
        
        let facticeMove = Move(owner: piece.owner, rowOrigin: originRow, columnOrigin: originColumn, rowDestination: destinationRow, columnDestination: destinationColumn)
        return isMoveValid(board, facticeMove)
    }
    
    /// Check is a moove is valid or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - move: The move we want to test
    /// - Returns: A boolean indicating either the move is possible or not
    public func isMoveValid(_ board: Board, _ move: Move) -> Bool {
        guard move.owner != .noOne else { return false }
        
        if move.rowDestination == move.rowOrigin && move.columnDestination == move.columnOrigin {
            return false
        }
        
        let nbRowsAndColumns = board.nbRows
        guard 0..<nbRowsAndColumns ~= move.columnDestination && 0..<nbRowsAndColumns ~= move.columnOrigin else {
            return false
        }
        guard 0..<nbRowsAndColumns ~= move.rowDestination && 0..<nbRowsAndColumns ~= move.rowOrigin else {
            return false
        }
        
        let rowMovement = abs(move.rowDestination - move.rowOrigin)
        let columnMovement = abs(move.columnDestination - move.columnOrigin)
        
        if rowMovement == 1 && columnMovement == 1 { return false }
        guard rowMovement <= 1 && columnMovement <= 1 else {
            return false
        }
        
        return true
    }
    
    /// Check if the game is finished or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - row: The row were the last move ended
    ///   - column: The column were the last move ended
    /// - Returns: Return a tuple with a boolean indicating if the game is over or not and the Result of the game
    public func isGameOver(onBoard board: Board, afterMoveRow row: Int, andColumn column: Int) -> (Bool, Result) {
        let denCells = board.grid.flatMap{$0}
                                 .filter{$0.cellType == .den}
                                 .filter{$0.piece?.owner != $0.initialOwner}
        
        guard denCells.count == 0 else {
            return (true, .winner(winner: denCells.first!.piece!.owner, reason: .denReached))
        }
        
        guard board.countPieces(of: .player1) != 0 else {
            return (true, .winner(winner: .player2, reason: .noMorePieces))
        }
        guard board.countPieces(of: .player2) != 0 else {
            return (true, .winner(winner: .player1, reason: .noMorePieces))
        }
        
        guard getMoves(board, .player1).count != 0 else {
            return (true, .winner(winner: .player2, reason: .noMovesLeft))
        }
        guard getMoves(board, .player2).count != 0 else {
            return (true, .winner(winner: .player1, reason: .noMovesLeft))
        }
        
        return (false, .notFinished)
    }
    
    public mutating func playedMove(move: Move, originalBoard: Board, afterMoveBoard: Board) {
        historic.append(move)
    }
}
