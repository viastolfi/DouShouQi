//
//  BoardResult.swift
//  
//
//  Created by Vincent Astolfi on 15/01/2024.
//

import Foundation

public enum BoardResult : Equatable {
    public static func ==(var1: BoardResult, var2: BoardResult) -> Bool{
        switch (var1, var2) {
        case (.unknown, .unknown):
            return true
        case (.ok, .ok):
            return true
        case (.failed, .failed):
            return true
        default:
            return false
        }
    }
    
    case unknown
    case ok
    case failed(reason: BoardFailingReason)
}
