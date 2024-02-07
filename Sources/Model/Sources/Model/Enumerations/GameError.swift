//
//  GameError.swift
//
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import Foundation

public enum GameError: Error {
    case invalidMove
    case nextPlayerError
    case badPlayerId(id: String)
}
