//
//  Cell.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Cell : CustomStringConvertible, Equatable, Hashable {
    public let cellType: CellType
    public let initialOwner: Owner
    public var piece: Piece?
    
    /// Change the way a Cell is display
    public var description: String {
        "\(piece?.description ?? "ø") on .\(cellType), \(initialOwner)"
    }

    /// Initializer of the class
    /// - Parameters:
    ///   - type: Type of the cell
    ///   - owner: Owner of the cell. By default: .noOne
    ///   - piece: Piece of the cell. By default: nil
    public init(ofType type: CellType, ownedBy owner: Owner = .noOne, withPiece piece: Piece? = nil) {
        self.cellType = type
        self.piece = piece
        self.initialOwner = owner
    }
}
