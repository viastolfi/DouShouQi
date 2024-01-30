//
//  Player.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class Player: Equatable {
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    public let id: Owner;
    public let name: String;
    
    public init?(withId id: Owner, andName name: String) {
        guard id != .noOne else {
            return nil
        }
        
        self.id = id
        self.name = name
    }
    
    public func chooseMove(in board: Board, with rules: Rules) -> Move? {
        fatalError("chooseMove(from:) has not been implemented")
    }
}
