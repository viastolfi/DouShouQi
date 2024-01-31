//
//  KeyboardInputs.swift
//
//
//  Created by Vincent Astolfi on 31/01/2024.
//

import Foundation
import Model

public struct KeyboardInputs {
    public static func getInputWithKeyboard(hu: HumanPlayer) -> Move?{
        print("\(hu.name) enter origin row")
        guard let originRow = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter origin column")
        guard let originColumn = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter destination row")
        guard let destinationRow = readLine() else {
            return nil
        }
        
        print("\(hu.name) enter destination column")
        guard let destinationColumn = readLine() else {
            return nil
        }
        
        guard originRow.isNumber || originColumn.isNumber || destinationRow.isNumber || destinationColumn.isNumber else { return nil }
        
        return Move(owner: hu.id, rowOrigin: Int(originRow)!, columnOrigin: Int(originColumn)!, rowDestination: Int(destinationRow)!, columnDestination: Int(destinationColumn)!)
    }
}
