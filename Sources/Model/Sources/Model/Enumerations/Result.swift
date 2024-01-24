//
//  Result.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public enum Result {
    case notFinished
    case even
    case winner(winner: Owner, reason: WinningReason)
}
