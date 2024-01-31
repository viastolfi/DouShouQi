// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Model
import ModelExtensions

@main
struct Application: ParsableCommand {
    mutating func run() throws {
        
        // create the rules and the board
        var rules = VerySimpleRules()
        guard var board = VerySimpleRules.createBoard() else {
            return
        }
        
        // Define the different player
        let player1 = RandomPlayer(withId: .player1, andName: "Lucas")!
        let player2 = HumanPlayer(withId: .player2, andName: "Vincent", andInputMethod: (KeyboardInputs.getInputWithKeyboard))!
        

        var result: (Bool , Result) = (false, .notFinished)
        var nextPlayer: Player = player2
        while(!result.0) {
            print(board.classique)
            print("⏳ Game is not over yet !")
            
            print("*******************")
            print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), it's your turn")
            print("*******************")
            
            var move = nextPlayer.chooseMove(in: board, with: rules)!
            printPlayedMove(nextPlayer, move)
            
            // Used in case the selected move don't exist
            // Only possible if the player is a HumanPlayer
            while(!rules.isMoveValid(board, move)) {
                print("😵 Not possible move")
                print("*******************")
                print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), Chose another move")
                print("*******************")
                move = nextPlayer.chooseMove(in: board, with: rules)!
                printPlayedMove(nextPlayer, move)
            }
            
            guard let movingPiece = board.grid[move.rowOrigin][move.columnOrigin].piece else {
                return
            }
            
            _ = board.remove(atRow: move.rowDestination, atColumn: move.columnDestination)
            _ = board.insert(piece: movingPiece, atRow: move.rowDestination, atColumn: move.columnDestination)
            _ = board.remove(atRow: move.rowOrigin , atColumn: move.columnOrigin)

            rules.playedMove(move: move, originalBoard: board, afterMoveBoard: board)
            
            result = rules.isGameOver(onBoard: board, afterMoveRow: move.rowDestination, andColumn: move.columnDestination)
            
            nextPlayer = move.owner == Owner.player1 ? player2 : player1
        }
        
        print("******************")
        print("CONGRATULATION \(result.1)")
        print("******************")
        print(board.classique)

    }
    
    
    
    private func printPlayedMove(_ nextPlayer: Player, _ move: Move) {
        print("*******************")
        print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), has chosen : player\(nextPlayer.id.description): [\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        print("*******************")
    }
}
