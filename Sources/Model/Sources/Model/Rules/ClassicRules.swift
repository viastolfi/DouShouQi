//
//  ClassicRules.swift
//
//
//  Created by Vincent Astolfi on 25/01/2024.
//

import Foundation

public struct ClassicRules : Rules {
    public var occurences: [Board : Int]
    
    public var historic: [Move]
    
    public static func createBoard() -> Board? {
        <#code#>
    }
    
    public static func checkBoard(_ board: Board) throws {
        
    }
    
    public func getNextPlayer() -> Owner {
        (historic.last?.owner == .player1 ? .player2 : .player1) ?? .noOne
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
    
    public func isGameOver(onBoard board: Board, afterMoveRow row: Int, andColumn column: Int) -> (Bool, Result) {
        <#code#>
    }
    
    public mutating func playedMove(move: Move, originalBoard: Board, afterMoveBoard: Board) {
        historic.append(move)
        
        // add the occurencie
    }
    
    
}
