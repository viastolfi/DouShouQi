//
//  Move.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public struct Move : Equatable, CustomStringConvertible, Hashable{
    public var description: String {
        "\(owner) move from (\(rowOrigin), \(columnOrigin)) to (\(rowDestination), \(columnDestination)"
    }
    
    public var owner: Owner
    public var rowOrigin: Int
    public var columnOrigin: Int
    public var rowDestination: Int
    public var columnDestination: Int
    
    public init(owner: Owner, rowOrigin: Int, columnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.columnOrigin = columnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
}
