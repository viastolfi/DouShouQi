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
        case .noMorePieces:
            return "the opponent's has no more pieces left."
        case .noMovesLeft:
            return "the opponent's has no more moves left."
        case .tooManyOccurences:
            return "to many occurences"
        }
    }
    
    case denReached;
    case noMorePieces;
    case noMovesLeft;
    case tooManyOccurences;
}
