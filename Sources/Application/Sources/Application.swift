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
        /*
        // Create a board as in the example
        var board = Board(withGrid: [
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .den),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .tiger))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .dog)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .leopard)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .wolf)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .elephant))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle),
                Cell(ofType: .water),
                Cell(ofType: .water),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .elephant)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .wolf)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .leopard)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .rat)),
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .dog)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .tiger)),
                Cell(ofType: .jungle),
                Cell(ofType: .trap),
                Cell(ofType: .den),
                Cell(ofType: .trap),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
            ]
        ])
        
        // If the board is created without problem, print it
        if let boardView = board?.classique {
            print(boardView)
            
            // test if the countPieces functions works
            print("Number of player1's pieces : \(board!.countPieces(of: .player1))")
            print("Number of player2's pieces : \(board!.countPieces(of: .player2))")
            print("Number of each player's pieces : \(board!.countPieces())\n")
            
            print("********** Remove test ********** \n")
            // Check if all the remove pieces case are working
            var result = board!.remove(atRow: 0, atColumn: 0)
            print("Result of removing piece at (0,0) : \(result), Number of each player's pieces after removal : \(board!.countPieces()), Number of player1's pieces after removal : \(board!.countPieces(of: .player1))\n")
            result = board!.remove(atRow: 9, atColumn: 0)
            print("Result of removing piece at (9,0) : \(result), Number of each player's pieces after removal : \(board!.countPieces()), Number of player2's pieces after removal : \(board!.countPieces(of: .player2))\n")
            result = board!.remove(atRow: 11, atColumn: 20)
            print("Result of removing piece at (11,20) : \(result)\n")
            result = board!.remove(atRow: 9, atColumn: 0)
            print("Result of removing piece at (9,0) : \(result)\n")
            
            print("********** Insertion test ********** \n")
            // Check if all the insert pieces case are working
            result = board!.insert(piece: Piece(withOwner: .player1, andAnimal: .lion), atRow: 0, atColumn: 0)
            print("Result of inserting piece at (0,0) : \(result), Number of each player's pieces after insertion : \(board!.countPieces()), Number of player1's pieces after insertion : \(board!.countPieces(of: .player1))\n")
            result = board!.insert(piece: Piece(withOwner: .player2, andAnimal: .tiger), atRow: 9, atColumn: 0)
            print("Result of inserting piece at (9,0) : \(result), Number of each player's pieces after insertion : \(board!.countPieces()), Number of player2's pieces after insertion : \(board!.countPieces(of: .player1))\n")
            result = board!.insert(piece: Piece(withOwner: .player1, andAnimal: .rat), atRow: 11, atColumn: 20)
            print("Result of inserting piece at (11,20) : \(result)\n")
            result = board!.insert(piece: Piece(withOwner: .player1, andAnimal: .elephant), atRow: 9, atColumn: 0)
            print("Result of inserting piece at (9,0) : \(result)\n")
            
        } else {
            print("Board couldn't be load")
        }
        */
        
        var rules = VerySimpleRules()
        
        guard var board = VerySimpleRules.createBoard() else {
            return
        }
        var result: (Bool , Result) = (false, .notFinished)
        let player1 = RandomPlayer(withId: .player1, andName: "Lucas")!
        let player2 = RandomPlayer(withId: .player2, andName: "Vincent")!
        
        var nextPlayer: Player = player2
        while(!result.0) {
            print(board.classique)
            print("⏳ Game is not over yet !")
            
            print("*******************")
            print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), it's your turn")
            print("*******************")
            
            var move = nextPlayer.chooseMove(in: board, with: rules)!
            printPlayedMove(nextPlayer, move)
            
            while(!rules.isMoveValid(board, move)) {
                print("😵 Not possible move")
                print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), Chose another move")
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
    }
    
    private func getInputWithKeyboard(hu: HumanPlayer) -> Move?{
        print("\(hu.name) enter origin row")
        guard let originRow = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter origin column")
        guard let originColumn = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter destination row")
        guard let destinationRow = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter destination column")
        guard let destinationColumn = readLine() else {
            return nil
        }
        
        guard originRow.isNumber || originColumn.isNumber || destinationRow.isNumber || destinationColumn.isNumber else { return nil }
        
        
        
        return Move(owner: hu.id, rowOrigin: Int(originRow)!, columnOrigin: Int(originColumn)!, rowDestination: Int(destinationRow)!, columnDestination: Int(destinationColumn)!)
    }
    
    private func printPlayedMove(_ nextPlayer: Player, _ move: Move) {
        print("*******************")
        print("player \(nextPlayer.id.symbol) \(nextPlayer.id.description) - \(nextPlayer.name), has chosen : player\(nextPlayer.id.description): [\(move.rowOrigin),\(move.columnOrigin)] -> [\(move.rowDestination),\(move.columnDestination)]")
        print("*******************")
    }
}
