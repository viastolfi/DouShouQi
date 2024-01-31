//
//  Player.swift
//
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public class Player: Equatable {
    /// Implementation of Equatable protocole
    /// - Parameters:
    ///   - lhs: left member
    ///   - rhs: right member
    /// - Returns: boolean correspoding to the operation result
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    public let id: Owner;
    public let name: String;
    
    /// Player initializer
    /// - Parameters:
    ///   - id: id of the player, of Owner type, can't be .noOne
    ///   - name: name of the player
    public init?(withId id: Owner, andName name: String) {
        guard id != .noOne else {
            return nil
        }
        
        self.id = id
        self.name = name
    }
    
    /// Choose a moove, implementation depends on the type of player
    /// - Parameters:
    ///   - board: the board we're playing in
    ///   - rules: the rules we are using
    /// - Returns: The move that is chosen by the player, can be nil.
    public func chooseMove(in board: Board, with rules: Rules) -> Move? {
        return nil
    }
}
