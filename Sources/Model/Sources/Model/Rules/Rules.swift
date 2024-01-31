//
//  Rules.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public protocol Rules {
    var occurences: [Board: Int] {get set}
    var historic: [Move] {get}
    
    /// Create a board that correspond to very simple rules
    /// - Returns: The board or nil if there is an exception
    static func createBoard() -> Board?
    
    /// Check if a board is usable in the very simple rules context
    /// - Parameter board: The board we want to test
    static func checkBoard(_ board: Board) throws
    
    /// Get the next player who plays
    /// - Returns: A player between the different owner enum
    func getNextPlayer() -> Owner
    
    /// Get all the possible moves for an owner
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - owner: The owner we want to know the moves he cas do
    /// - Returns: An array of all the possible moves
    func getMoves(_ board: Board, _ owner: Owner) -> Array<Move>
    
    /// Get all the possible moves from a origin cell
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - owner: The owner of the piece
    ///   - row: The original row we are moving from
    ///   - column: The original column we are moving from
    /// - Returns: An array of all the possible move
    func getMoves(_ board: Board, _ owner: Owner, originRow row: Int, originColumn column: Int) -> Array<Move>
    
    /// Check is a moove is valid or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - originRow: The origin row of the move
    ///   - originColumn: The origin column of the move
    ///   - destinationRow: The destination row of the move
    ///   - destinationColumn: The destination column of the move
    /// - Returns: A boolean indicating either the move is possible or not
    func isMoveValid(_ board: Board, originRow: Int, originColumn: Int, destinationRow: Int, destinationColumn: Int) -> Bool
    
    /// Check is a moove is valid or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - move: The move we want to test
    /// - Returns: A boolean indicating either the move is possible or not
    func isMoveValid(_ board: Board, _ move: Move) -> Bool
    
    /// Check if the game is finished or not
    /// - Parameters:
    ///   - board: The board we are playing in
    ///   - row: The row were the last move ended
    ///   - column: The column were the last move ended
    /// - Returns: Return a tuple with a boolean indicating if the game is over or not and the Result of the game
    func isGameOver(onBoard board: Board, afterMoveRow row: Int, andColumn column: Int) -> (Bool, Result)
    
    
    /// Add the last play on the historic and boards in the occurencies
    /// - Parameters:
    ///   - move: The last move that were played
    ///   - originalBoard: The board before the move
    ///   - afterMoveBoard: The board after the move
    mutating func playedMove(move: Move, originalBoard: Board, afterMoveBoard: Board)
}
