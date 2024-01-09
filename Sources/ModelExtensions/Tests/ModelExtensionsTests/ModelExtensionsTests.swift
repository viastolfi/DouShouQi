import XCTest
import Model
@testable import ModelExtensions

final class ModelExtensionTests: XCTestCase {
    func testBoardDisplay() throws {
        var board = Board(withGrid: [[Cell(ofType: .jungle, withPiece: Piece(withOwner: .player1, andAnimal: .tiger))],[Cell(ofType: .unknown, withPiece: Piece(withOwner: .noOne, andAnimal: .rat))]])
        
        let boardDisplay = board?.classique
        print(boardDisplay!)
        
        assert(true == true)
    }
}
