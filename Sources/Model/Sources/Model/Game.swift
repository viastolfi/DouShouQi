//
//  Game.swift
//
//
//  Created by Vincent Astolfi on 06/02/2024.
//

import Foundation

public struct Game {
    var rules: Rules
    var board: Board
    var player1: Player
    var player2: Player
    
    private var startGameListeners: [(Board) -> Void] = []
    private var notifyPlayerTurnListeners: [(Player, Board) -> Void] = []
    private var playedMoveListeners: [(Player, Move) -> Void] = []
    private var showWinnerListeners: [(Board,Result) -> Void] = []
    private var notPossibleMoveListeners: [(Player, Move) -> Void] = []
    
    public init(withRules rules: Rules,andPlayer1 player1: Player,andPlayer2 player2: Player) {
        self.rules = rules
        self.board = type(of: rules).createBoard()!
        self.player1 = player1
        self.player2 = player2
    }
    
    public mutating func addStartGameListener(listener: @escaping (Board) -> Void) {
        startGameListeners.append(listener)
    }
    
    public mutating func addNotifyPlayerTurnListenenr(listener: @escaping (Player, Board) -> Void) {
        notifyPlayerTurnListeners.append(listener)
    }
    
    public mutating func addPlayedMoveListener(listener: @escaping (Player, Move) -> Void) {
        playedMoveListeners.append(listener)
    }
    
    public mutating func addShowWinnerListener(listener: @escaping (Board, Result) -> Void) {
        showWinnerListeners.append(listener)
    }
    
    public mutating func addNotPossibleMoveListener(listener: @escaping (Player, Move) -> Void) {
        notPossibleMoveListeners.append(listener)
    }
    
    public mutating func start() {
        for listener in startGameListeners {
            listener(board)
        }
        
        var currentPlayer = chooseFirstPlayerRandomly()
        var result = (false, Result.notFinished)
        
        while(!result.0) {
            for listener in notifyPlayerTurnListeners {
                listener(currentPlayer, board)
            }
            
            var move = currentPlayer.chooseMove(in: board, with: rules)!
            
            for listener in playedMoveListeners {
                listener(currentPlayer, move)
            }
            
            while(!rules.isMoveValid(board, move)) {
                for listener in notPossibleMoveListeners {
                    listener(currentPlayer, move)
                }
                move = currentPlayer.chooseMove(in: board, with: rules)!
                
                for listener in playedMoveListeners {
                    listener(currentPlayer, move)
                }
            }
            
            guard let movingPiece = board.grid[move.rowOrigin][move.columnOrigin].piece else {
                return
            }
            
            _ = board.remove(atRow: move.rowDestination, atColumn: move.columnDestination)
            _ = board.insert(piece: movingPiece, atRow: move.rowDestination, atColumn: move.columnDestination)
            _ = board.remove(atRow: move.rowOrigin , atColumn: move.columnOrigin)
            
            rules.playedMove(move: move, originalBoard: board, afterMoveBoard: board)
            
            result = rules.isGameOver(onBoard: board, afterMoveRow: move.rowDestination, andColumn: move.columnDestination)
            
            currentPlayer = move.owner == Owner.player1 ? player2 : player1
        }
        
        for listener in showWinnerListeners {
            listener(board, result.1)
        }
    }
    
    private func chooseFirstPlayerRandomly() -> Player {
        return Int.random(in: 0...1) == 0 ? player1 : player2
    }
}
