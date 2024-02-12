//
//  BoardToJson.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

extension Board : Encodable {
    enum CodingKeys: String, CodingKey {
        case cells
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grid, forKey: .cells)
    }
}
