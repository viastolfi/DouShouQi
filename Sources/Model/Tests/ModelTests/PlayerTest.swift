//
//  PlayerTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class PlayerTest: XCTestCase {
    private var player: Player!
    
    override func setUpWithError() throws {
        self.player = Player(withId: .player1, andName: "Literally no one")
    }

    func testInit() throws {
        XCTAssertEqual(player.id, Owner.player1)
        XCTAssertEqual(player.name, "Literally no one")        
        XCTAssertNil(Player(withId: .noOne, andName: "Can't be no one"))
    }
    
    func testChooseMove() throws {
        let board = VerySimpleRules.createBoard()!
        let rules = VerySimpleRules()
        XCTAssertNil(player.chooseMove(in: board, with: rules))
    }
    
    func testEquatable() throws {
        var otherPlayer = Player(withId: .player1, andName: "Literally no one")
        XCTAssertTrue(otherPlayer == player)
        otherPlayer = Player(withId: .player2, andName: "Literally no one")
        XCTAssertFalse(otherPlayer == player)
        otherPlayer = Player(withId: .player1, andName: "Still no one")
        XCTAssertFalse(otherPlayer == player)
    }

}
