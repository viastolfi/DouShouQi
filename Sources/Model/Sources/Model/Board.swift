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
    
    // Initializer of the class that can return nil
    public init?(withGrid grid: [[Cell]]) {
        // Check if every column of the Grid have the same size, else return nil
        guard grid.allSatisfy({$0.count == grid[0].count }) else {
            return nil
        }
        
        self.nbRows = grid[0].count
        self.nbColumns = grid.count
        self.grid = grid
    }
    
    public func countPieces(of owner: Owner) -> Int {
        let flat_array = grid.flatMap{ $0 }
        return flat_array.filter({ $0.piece?.owner == owner }).count
    }
    
    public func countPieces() -> (Int, Int) {
        let flat_array = grid.flatMap{ $0 }
        return (flat_array.filter({ $0.piece?.owner == .player1 }).count, flat_array.filter({ $0.piece?.owner == .player2 }).count)
    }
    
    public func insert(piece: Piece, atRow row: Int, atColumn column: Int) -> BoardResult{
        // .unknown if nothing works ?
        guard row <= nbRows || column <= nbColumns else {
            return .failed(reason: .outOfBounds)
        } 
        if let piece = grid[row][column].piece {
            if piece.owner != .noOne {
                return .failed(reason: .cellNotEmpty)
            }
        }
        
        return .ok
    }
    
    public func remove(atRow row: Int, atColumn column: Int) -> BoardResult {
        if row > nbRows || column > nbColumns {
            return .failed(reason: .outOfBounds)
        }
        guard grid[row][column].piece != nil && grid[row][column].piece!.owner != .noOne else{
            return .failed(reason: .cellEmpty)
        }
        
        return .ok
    }
}
