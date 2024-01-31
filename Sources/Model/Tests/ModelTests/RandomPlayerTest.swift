//
//  RandomPlayerTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class RandomPlayerTest: XCTestCase {
    private var player: RandomPlayer!
    private var board: Board!
    private var rules: Rules!

    override func setUpWithError() throws {
        self.player = RandomPlayer(withId: .player2, andName: "Stupid robot")
        self.rules = VerySimpleRules()
        self.board = VerySimpleRules.createBoard()
    }

    func testInit() throws {
        XCTAssertEqual(player.id, Owner.player2)
        XCTAssertEqual(player.name, "Stupid robot")
    }
    
    func testChooseMove() throws {
        let moves = rules.getMoves(board, player.id)
        XCTAssertTrue(moves.contains(player.chooseMove(in: board, with: rules)!))
    }
}
