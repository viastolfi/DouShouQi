//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Board : Hashable{
    public let nbRows: Int
    public let nbColumns: Int
    public private(set) var grid: [[Cell]]
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(grid)
    }
    
    public static func == (lhs: Board, rhs: Board) -> Bool {
        lhs.grid == rhs.grid
    }
    
    /// Initializer of the class that can return nil
    /// - Parameter grid: The grid of our board
    public init?(withGrid grid: [[Cell]]) {
        if grid.isEmpty || grid[0].isEmpty {
            return nil
        }
        // Check if every column of the Grid have the same size, else return nil
        guard grid.allSatisfy({$0.count == grid[0].count }) else {
            return nil
        }
        
        self.nbRows = grid.count
        self.nbColumns = grid[0].count
        self.grid = grid
    }
    
    /// countPieces
    /// - Parameter owner: The owner we want to know the number of pieces he own
    /// - Returns: Number of pieces the owner own
    public func countPieces(of owner: Owner) -> Int {
        grid.countOccurenceInCell(condition: {return $0.piece?.owner == owner})
    }
    
    /// countPieces
    /// - Returns: Tuple containing the number of pieces of every player
    public func countPieces() -> (player1_count: Int,player2_count: Int) {
        (countPieces(of: .player1), countPieces(of: .player2))
    }
    
    /// insert
    /// - Parameters:
    ///   - piece: The piece we want to insert
    ///   - row: Row of the Board
    ///   - column: Column of the Board
    /// - Returns: Result of the insert
    public mutating func insert(piece: Piece, atRow row: Int, atColumn column: Int) -> BoardResult{
        guard row <= nbRows || column <= nbColumns else {
            return .failed(reason: .outOfBounds)
        } 
        if let piece = grid[row][column].piece {
            if piece.owner != .noOne {
                return .failed(reason: .cellNotEmpty)
            }
        }
        
        self.grid[row][column].piece = piece
            
        return .ok
    }
    
    /// remove
    /// - Parameters:
    ///   - row: Row of the Board
    ///   - column: Column of the Board
    /// - Returns: Result of the remove
    public mutating func remove(atRow row: Int, atColumn column: Int) -> BoardResult {
        if row > nbRows || column > nbColumns {
            return .failed(reason: .outOfBounds)
        }
        guard grid[row][column].piece != nil && grid[row][column].piece!.owner != .noOne else{
            return .failed(reason: .cellEmpty)
        }
        
        self.grid[row][column].piece = nil

        return .ok
    }
}
