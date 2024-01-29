//
//  InvalidPlayerError.swift
//  
//
//  Created by Vincent Astolfi on 29/01/2024.
//

import Foundation

public enum InvalidPlayerError : Error {
    case noMoveLeft(player: Owner)
}
