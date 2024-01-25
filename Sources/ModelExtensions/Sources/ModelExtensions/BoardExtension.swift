//
//  BoardExtension.swift
//
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation
import Model

extension Board {
    // Allow to print the Board int the same way as it's done in the example
    public var classique: String {
        var out: String = "  "
        for row in self.grid {
            for cell in row {
                // Concatenate the out string with the symbol of the objects contains in the cell
                out = "\(out)\(cell.cellType.symbol)\(cell.piece?.animal.symbol ?? "  ")\(cell.piece?.owner.symbol ?? "  ")  "
            }
            out = "\(out)\n\n  "
        }
        return out
    }
}
