//
//  BoardFailingReason.swift
//  
//
//  Created by Vincent Astolfi on 15/01/2024.
//

import Foundation

public enum BoardFailingReason : Equatable{
    public static func ==(var1: BoardFailingReason, var2: BoardFailingReason) -> Bool{
        switch (var1, var2) {
        case (.unknown, .unknown):
            return true
        case (.outOfBounds, .outOfBounds):
            return true
        case (.cellNotEmpty, .cellNotEmpty):
            return true
        case (.cellEmpty, .cellEmpty):
            return true
        default:
            return false
        }
    }
    
    case unknown
    case outOfBounds
    case cellNotEmpty
    case cellEmpty
}
