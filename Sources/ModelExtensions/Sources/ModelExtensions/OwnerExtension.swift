//
//  OwnerExtension.swift
//
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation
import Model

extension Owner {
    public var symbol: String {
        switch self {
        case .noOne:
            return "  "
        case .player1:
            return "🟡"
        case .player2:
            return "🔴"
        }
    }
}
