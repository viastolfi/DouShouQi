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
import Serialization

@main
struct Application_TP5: ParsableCommand {
    mutating func run() throws {
        let b = VerySimpleRules.createBoard()!
        Encode.encode(b)
        
        print("Welcome in DouShouQi game")
        print("**************************************")
        print("Choose start up option : ")
        print("1 - Two random player")
        print("2 - One real player vs one random player")
        print("3 - Two real player")
        print("0 - leave")
        print("**************************************")
        guard let choice = readLine() else {
            print("Please choose a strat up option")
            return
        }
        
        guard choice.isNumber else {
            print("Choose a number as start up option")
            return
        }
        
        var player1: Player
        var player2: Player
        switch(Int(choice)) {
        case 1:
            player1 = RandomPlayer(withId: .player1, andName: "Very")!
            player2 = RandomPlayer(withId: .player2, andName: "Stupid")!
        case 2:
            print("Choose your name : ")
            guard let name = readLine() else {
                print("Please choose a valid name")
                return
            }
            player1 = HumanPlayer(withId: .player1, andName: name, andInputMethod: KeyboardInputs.getInputWithKeyboard)!
            player2 = RandomPlayer(withId: .player2, andName: "Stupid")!
        case 3:
            print("Choose player1's name : ")
            guard let name1 = readLine() else {
                print("Please choose a valid name")
                return
            }
            print("Choose player2's name : ")
            guard let name2 = readLine() else {
                print("Please choose a valid name")
                return
            }
            player1 = HumanPlayer(withId: .player1, andName: name1, andInputMethod: KeyboardInputs.getInputWithKeyboard)!
            player2 = HumanPlayer(withId: .player2, andName: name2, andInputMethod: KeyboardInputs.getInputWithKeyboard)!
        case 0:
            print("Exiting the program")
            return
        default:
            print("Choose an option between the possible ones")
            return
        }
        
        var game = Game(withRules: VerySimpleRules(),
                        andPlayer1: player1,
                        andPlayer2: player2)
        game.addStartGameListener(listener: notifyStartGame)
        game.addNotifyPlayerTurnListenenr(listener: notifyPlayerTurn)
        game.addPlayedMoveListener(listener: playedMove)
        game.addShowWinnerListener(listener: showWinner)
        game.addNotPossibleMoveListener(listener: notPossibleMove)
        game.addBoardChangedListener(listener: showBoard)
        game.start()
    }
    
    /// Notify every player that the game has started
    private func notifyStartGame() -> Void {
        print("**************************************")
        print("        ==>> GAME STARTS! <<==        ")
        print("**************************************")
    }
    
    /// Notify who is it to play
    /// - Parameter player: The player that has to play
    private func notifyPlayerTurn(player: Player) -> Void {
        print("**************************************")
        print("player \(player.id.symbol) \(player.id.description) - \(player.name), it's your turn")
        print("**************************************")
    }
    
    /// Notify every player the move the current player has done
    /// - Parameters:
    ///   - player: the current player
    ///   - move: the move he has done
    private func playedMove(player: Player, move: Move) -> Void {
        print("**************************************")
        print("player \(player.id.symbol) \(player.id.description) - \(player.name), has chosen : player\(player.id.description): [\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        print("**************************************")
    }
    
    
    /// Notify every player that the game is finished, show the winner and the result
    /// - Parameter result: result of the game
    private func showWinner(result: Result) -> Void {
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
    
    /// Notify every player that the move the current player has done is impossible
    /// - Parameters:
    ///   - player: the current player
    ///   - move: the move he has done
    private func notPossibleMove(player: Player, move: Move?) -> Void {
        print("**************************************")
        print("😵 Not possible move")
        if let move = move {
            print("[\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        } else {
            print("Error while reading Move please try again")
        }
        print("player \(player.id.symbol) \(player.id.description) - \(player.name), Chose another move")
        print("**************************************")
    }
    
    /// Notify every player that the board has changed and show it
    /// - Parameter board: the board that has changed
    private func showBoard(board: Board) -> Void {
        print(board.classique)
    }
}
