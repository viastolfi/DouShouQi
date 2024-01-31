//
//  HumanPlayer.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class HumanPlayer: Player {
    private var input: (HumanPlayer) -> Move?
    
    /// HumanPlayer initializer
    /// - Parameters:
    ///   - id: id of the player, of Owner type, can't be .noOne
    ///   - name: name of the player
    ///   - input: the input method that we will use to create the move. Injected from the initializer
    public init?(withId id: Owner, andName name: String, andInputMethod input: @escaping (HumanPlayer) -> Move?) {
        self.input = input
        super.init(withId: id, andName: name)
    }
    
    /// Same as in the parent class
    /// Use the stocked injected method
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        input(self)
    }
}
