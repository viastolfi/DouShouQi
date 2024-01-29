//
//  RandomPlayer.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class RandomPlayer: Player {
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let moves = rules.getMoves(board, self.id)
        
        guard let move = moves.randomElement() else {
            return nil
        }
        
        return move
    }
}


