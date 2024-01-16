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
        
    }
}
