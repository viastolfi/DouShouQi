//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 06/02/2024.
//

import Foundation
import Model
import ModelExtensions
import ArgumentParser

@main
struct Application_TP5: ParsableCommand {
    mutating func run() throws {
        // Choose the players
        var game = Game(withRules: VerySimpleRules(),
                        andPlayer1: RandomPlayer(withId: .player1, andName: "Very")!,
                        andPlayer2: RandomPlayer(withId: .player2, andName: "Stupid")!)
        game.addStartGameListener(listener: notifyStartGame)
        game.addNotifyPlayerTurnListenenr(listener: notifyPlayerTurn)
        game.addPlayedMoveListener(listener: playedMove)
        game.addShowWinnerListener(listener: showWinner)
        game.start()
    }
    
    private func notifyStartGame(board: Board) -> Void {
        print(board.classique)
        print("**************************************")
        print("        ==>> GAME STARTS! <<==        ")
        print("**************************************")
    }
    
    private func notifyPlayerTurn(player: Player, board: Board) -> Void {
        print(board.classique)
        print("**************************************")
        print("player \(player.id.symbol) \(player.id.description) - \(player.name), it's your turn")
        print("**************************************")
    }
    
    private func playedMove(player: Player, move: Move) -> Void {
        print("**************************************")
        print("player \(player.id.symbol) \(player.id.description) - \(player.name), has chosen : player\(player.id.description): [\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        print("**************************************")
    }
    
    private func showWinner(board: Board, result: Result) {
        print(board.classique)
        print("**************************************")
        print("Game Over!!!")
        switch(result) {
        case .winner(let winner,let reason):
            print("and the winner is... player\(winner)!")
            print("\(reason)")
        default:
            return
        }
        print("**************************************")
    }
    
    private func notPossibleMove(player: Player, move: Move) {
        print("**************************************")
        print("😵 Not possible move")
        print("[\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        print("player \(move.owner.symbol) \(player.id.description) - \(player.name), Chose another move")
        print("**************************************")
    }
}
