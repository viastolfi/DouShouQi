//
//  Animal.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public enum Animal : Int, Comparable {
    case rat
    case cat
    case dog
    case wolf
    case leopard
    case tiger
    case lion
    case elephant
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs == .elephant && rhs == .rat { return true }
        if rhs == .elephant && lhs == .rat { return false }
        return lhs.rawValue < rhs.rawValue
    }
}
