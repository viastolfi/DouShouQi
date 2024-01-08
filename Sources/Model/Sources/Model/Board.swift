//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Board {
    public let nbRows: Int = 0
    public let nbColumns: Int = 0
    public private(set) var grid: [[Cell]]
    
    public init?(withGrid grid: [[Cell]]) {
        if grid.isEmpty {
            return nil
        }
        
        let gridSize = grid[0].count
        
        for row in grid {
            if row.count != gridSize {
                return nil
            }
        }
        
        self.grid = grid
    }
}
