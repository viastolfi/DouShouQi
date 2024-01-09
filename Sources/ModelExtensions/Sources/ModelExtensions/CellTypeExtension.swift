//
//  File.swift
//
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation
import Model

extension CellType {
    public var symbol: String {
        switch self {
        case .unknown:
            return " "
        case .jungle:
            return "🌿"
        case .den:
            return "🪹"
        case .trap:
            return "🪤"
        case .water:
            return "💧"
        }
    }
}
