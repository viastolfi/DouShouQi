//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Piece : CustomStringConvertible {
    // Rewrite string convertible of the class
    public var description: String {
        "[\(owner):\(animal)]"
    }
    
    public let owner: Owner
    public let animal: Animal
    
    public init(withOwner owner: Owner, andAnimal animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
}
