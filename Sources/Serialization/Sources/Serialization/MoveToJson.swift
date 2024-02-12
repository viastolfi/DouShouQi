//
//  MoveToJson.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

extension Move : Encodable {    
    enum CodingKeys: String, CodingKey {
        case owner
        case rowOrigin
        case columnOrigin
        case rowDestination
        case columnDestination
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(rowOrigin, forKey: .rowOrigin)
        try container.encode(columnOrigin, forKey: .columnOrigin)
        try container.encode(rowDestination, forKey: .rowDestination)
        try container.encode(columnDestination, forKey: .columnDestination)
    }
}
