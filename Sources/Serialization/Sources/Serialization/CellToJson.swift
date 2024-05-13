//
//  CellToJson.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

extension Cell : Encodable {
    enum CodingKeys: String, CodingKey {
        case cellType
        case initialOwner
        case piece
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cellType, forKey: .cellType)
        try container.encode(initialOwner, forKey: .initialOwner)
        try container.encode(piece, forKey: .piece)
    }
}
