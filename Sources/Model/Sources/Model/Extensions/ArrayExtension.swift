//
//  ArrayExtension.swift
//  
//
//  Created by Vincent Astolfi on 17/01/2024.
//

import Foundation

extension Array where Element == Array<Cell> {
    /// countOccurenceInCell
    /// - Parameter condition: Function that correspond to the test we want to do
    /// - Returns: Value return after the test
    func countOccurenceInCell(condition: (Cell) -> Bool) -> Int {
        self.flatMap{$0}.filter{condition($0)}.count
    }    
}

extension Array where Element == (CellType, (Int, Int)) {
    func getCellTypeWithCoordinates(_ c: (Int, Int)) -> CellType? {
        for t in self {
            if t.1 == c {
                return t.0
            }
        }
        return nil
    }
}
