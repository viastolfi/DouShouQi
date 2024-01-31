//
//  RandomPlayer.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class RandomPlayer: Player {
    /// Same as in the Parent class
    /// Chose the movement randomly in all the possible ones
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let moves = rules.getMoves(board, self.id)
        
        guard let move = moves.randomElement() else {
            return nil
        }
        
        return move
    }
}


