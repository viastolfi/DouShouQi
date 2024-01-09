import XCTest
@testable import Model
@testable import ModelExtensions

final class ModelExtensionTests: XCTestCase {
    func testBoardDisplay() throws {
        let board = Board(withGrid: [
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
        
        if let finalBoard = board {
            let boardDisplay = finalBoard.classique
            let exampleBoard = "  🌿🦁🟡  🌿      🪤      🪹      🪤      🌿      🌿🐯🟡  \n\n  🌿      🌿🐶🟡  🌿      🪤      🌿      🌿🐱🟡  🌿      \n\n  🌿🐭🟡  🌿      🌿🐆🟡  🌿      🌿🐺🟡  🌿      🌿🐘🟡  \n\n  🌿      💧      💧      🌿      💧      💧      🌿      \n\n  🌿      💧      💧      🌿      💧      💧      🌿      \n\n  🌿      💧      💧      🌿      💧      💧      🌿      \n\n  🌿      💧      💧      🌿      💧      💧      🌿      \n\n  🌿🐘🔴  🌿      🌿🐺🔴  🌿      🌿🐆🔴  🌿      🌿🐭🔴  \n\n  🌿      🌿🐱🔴  🌿      🪤      🌿      🌿🐶🔴  🌿      \n\n  🌿🐯🔴  🌿      🪤      🪹      🪤      🌿      🌿🦁🔴  \n\n  "
            
            print(boardDisplay)
            print(exampleBoard)
            assert(boardDisplay == exampleBoard)
        }
        
        
        
    }
}
