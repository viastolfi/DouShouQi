//
//  Owner.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public enum Owner : CustomStringConvertible, Equatable {
    /// Change the way a Owner is display
    public var description: String {
        switch self {
        case .noOne:
            return "x"
        case .player1:
            return "1"
        case .player2:
            return "2"
        }
    }
    
    case noOne
    case player1
    case player2
}
