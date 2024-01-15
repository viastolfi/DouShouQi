//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Board {
    public let nbRows: Int
    public let nbColumns: Int
    public private(set) var grid: [[Cell]]
    
    public init?(withGrid grid: [[Cell]]) {
        guard grid.allSatisfy({$0.count == grid[0].count }) else {
            return nil
        }
        
        self.nbRows = grid[0].count
        self.nbColumns = grid.count
        self.grid = grid
    }
}
