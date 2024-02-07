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
    
    /// All the arrays that stocks the called function for displaying
    private var startGameListeners: [() -> Void] = []
    private var notifyPlayerTurnListeners: [(Player) -> Void] = []
    private var playedMoveListeners: [(Player, Move) -> Void] = []
    private var showWinnerListeners: [(Result) -> Void] = []
    private var notPossibleMoveListeners: [(Player, Move?) -> Void] = []
    private var boardChangedListeners: [(Board) -> Void] = []
    
    /// initializer of the Game class
    /// - Parameters:
    ///   - rules: the rules we are playing on
    ///   - player1: First player of the game
    ///   - player2: Second player of the game
    public init(withRules rules: Rules,andPlayer1 player1: Player,andPlayer2 player2: Player) {
        self.rules = rules
        self.board = type(of: rules).createBoard()!
        self.player1 = player1
        self.player2 = player2
    }
    
    /// All the fucntion that allow you to add new called function in the corresponding array
    public mutating func addStartGameListener(listener: @escaping () -> Void) {
        startGameListeners.append(listener)
    }
    
    public mutating func addNotifyPlayerTurnListenenr(listener: @escaping (Player) -> Void) {
        notifyPlayerTurnListeners.append(listener)
    }
    
    public mutating func addPlayedMoveListener(listener: @escaping (Player, Move) -> Void) {
        playedMoveListeners.append(listener)
    }
    
    public mutating func addShowWinnerListener(listener: @escaping (Result) -> Void) {
        showWinnerListeners.append(listener)
    }
    
    public mutating func addNotPossibleMoveListener(listener: @escaping (Player, Move?) -> Void) {
        notPossibleMoveListeners.append(listener)
    }
    
    public mutating func addBoardChangedListener(listener: @escaping (Board) -> Void) {
        boardChangedListeners.append(listener)
    }
    
    /// Start the game and the game loop
    public mutating func start() {
        for listener in startGameListeners {
            listener()
        }
        
        notifyBoardChanged()

        var currentPlayer = chooseFirstPlayerRandomly()
        var result = (false, Result.notFinished)
        
        while(!result.0) {
            for listener in notifyPlayerTurnListeners {
                listener(currentPlayer)
            }
            
            notifyBoardChanged()

            var isMove: (Bool, Move?) = (false, nil)
            
            while(!isMove.0) {
                isMove = playerMove(currentPlayer)
                
            }
            
            let move = isMove.1!
            for listener in playedMoveListeners {
                listener(currentPlayer, move)
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
            listener(result.1)
        }
        
        notifyBoardChanged()
    }
    
    /// Current player try to move.
    /// If the move is possible we return it else we recall this function
    /// If move is nil (if the HumanPlayer do something wrong for example) we return false
    /// - Parameter currentPlayer: The current player
    /// - Returns: We return a tuple with a Bool representing if the move is possible or not and a Move? corresponding to player's move
    private func playerMove(_ currentPlayer: Player) -> (Bool, Move?) {
        let move = currentPlayer.chooseMove(in: board, with: rules)
        
        guard let m = move else {
            notifyNotPossibleMove(currentPlayer, move)
            return (false, nil)
        }
        
        if rules.isMoveValid(board, m) { return (true, m) }
        
        for listener in playedMoveListeners {
            listener(currentPlayer, m)
        }
        
        notifyNotPossibleMove(currentPlayer, m)
        
        notifyBoardChanged()
        
        return playerMove(currentPlayer)
    }
    
    /// Choose who's gonna be the first player randomly
    /// - Returns: One of the two player
    private func chooseFirstPlayerRandomly() -> Player {
        return Int.random(in: 0...1) == 0 ? player1 : player2
    }
    
    /// Call the functions that show the board after it changed
    private func notifyBoardChanged() {
        for listener in boardChangedListeners {
            listener(board)
        }
    }
    
    /// Call the functions that show that a move is impossible
    /// - Parameters:
    ///   - currentPlayer: the player that has done the move
    ///   - move: the move that is not possible
    private func notifyNotPossibleMove(_ currentPlayer: Player, _ move: Move?) {
        for listener in notPossibleMoveListeners {
            listener(currentPlayer, move)
        }
    }
}
