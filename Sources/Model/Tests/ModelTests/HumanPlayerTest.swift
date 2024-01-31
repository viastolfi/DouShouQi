//
//  HumanPlayerTest.swift
//  
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import XCTest
@testable import Model

final class HumanPlayerTest: XCTestCase {
    private var human: HumanPlayer!
    private var board: Board!
    private var rules: Rules!
    
    override func setUpWithError() throws {
        self.board = VerySimpleRules.createBoard()
        self.rules = VerySimpleRules()
        self.human = HumanPlayer(withId: .player1, andName: "Test", andInputMethod: {Move(owner: $0.id, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)})!
    }

    func testInit() throws {
        XCTAssertEqual(human.id, Owner.player1)
        XCTAssertEqual(human.name, "Test")
    }
    
    func testChooseMove() throws {
        let expectedMove = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)
        
        XCTAssertEqual(human.chooseMove(in: board, with: rules), expectedMove)
    }
}
