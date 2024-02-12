//
//  PieceToJson.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

extension Piece : Encodable {
    enum CodingKeys: String, CodingKey {
        case owner
        case animal
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(animal, forKey: .animal)
    }
}
