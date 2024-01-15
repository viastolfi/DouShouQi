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
                out = "\(out)\(cell.cellType.symbol)\(cell.piece?.animal.symbol ?? "  ")\(cell.piece?.owner.symbol ?? "  ")  "
            }
            out = "\(out)\n\n  "
        }
        return out
    }
}
