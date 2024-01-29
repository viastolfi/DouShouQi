//
//  HumanPlayer.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class HumanPlayer: Player {
    private var input: (HumanPlayer) -> Move?

    public init?(withId id: Owner, andName name: String, andInputMethod input: @escaping (HumanPlayer) -> Move?) {
        self.input = input
        super.init(withId: id, andName: name)
    }
    
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        input(self)
    }
}
