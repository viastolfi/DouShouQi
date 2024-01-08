//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Cell : CustomStringConvertible {
    public var description: String {
        "\(piece?.description ?? "ø") on .\(cellType), \(initialOwner)"
    }
    
    public let cellType: CellType
    public let initialOwner: Owner
    public let piece: Piece?
    
    public init(ofType type: CellType, ownedBy owner: Owner = .noOne, withPiece piece: Piece? = nil) {
        self.cellType = type
        self.piece = piece
        self.initialOwner = owner
    }
}
