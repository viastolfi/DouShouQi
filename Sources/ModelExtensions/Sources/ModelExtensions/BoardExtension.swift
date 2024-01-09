//
//  File.swift
//
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation
import Model

extension Board {
    public var classique: String {
        var out: String = "  "
        for row in self.grid {
            for cell in row {
                if let piece = cell.piece {
                    out += cell.cellType.symbol + piece.animal.symbol + piece.owner.symbol
                } else {
                    out += cell.cellType.symbol + "    "
                }
                out += "  "
            }
            out += "\n\n  "
        }
        return out
    }
}
