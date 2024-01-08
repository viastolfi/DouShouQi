//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public enum Owner : String, CustomStringConvertible {
    public var description: String {
        self.rawValue
    }
    
    case noOne = "x"
    case player1 = "1"
    case player2 = "2"
}
