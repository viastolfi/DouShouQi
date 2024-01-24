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
    
    static func createBoard() -> Board?
    static func checkBoard(_ board: Board) throws
    func getNextPlayer() -> Owner
    func getMoves(_ board: Board, _ owner: Owner) -> Array<Move>
    func getMoves(_ board: Board, _ owner: Owner, originRow row: Int, originColumn column: Int) -> Array<Move>
    func isMoveValid(_ board: Board, originRow: Int, originColumn: Int, destinationRow: Int, destinationColumn: Int) -> Bool
    func isMoveValid(_ board: Board, _ move: Move) -> Bool
    func isGameOver(onBoard board: Board, afterMoveRow row: Int, andColumn column: Int) -> (Bool, Result)
    mutating func playedMove(move: Move, originalBoard: Board, afterMoveBoard: Board)
}
