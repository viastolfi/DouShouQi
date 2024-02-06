//
//  WinningReason.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public enum WinningReason: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .denReached:
            return "the opponent's den has been reached."
        default:
            return "J'ai pas fais ouais"
        }
    }
    
    case denReached;
    case noMorePieces;
    case noMovesLeft;
    case tooManyOccurences;
}
