//
//  PieceTests.swift
//  
//
//  Created by Vincent Astolfi on 09/01/2024.
//

import XCTest
@testable import Model

final class PieceTests: XCTestCase {
    // Test if the CustomStringConvertible implementation is working well
    func customStringPieceTest() throws {
        var piece_description = Piece(withOwner: .player1, andAnimal: .dog).description
        assert(piece_description == "[1:dog]")
        
        piece_description = Piece(withOwner: .player2, andAnimal: .cat).description
        assert(piece_description == "[2:cat]")
        
        piece_description = Piece(withOwner: .noOne, andAnimal: .wolf).description
        assert(piece_description == "[x:wolf]")
    }
}
