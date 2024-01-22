//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 08/01/2024.
//

import Foundation

public struct Piece : CustomStringConvertible, Equatable, Hashable {
    /// Change the way a Piece is display
    public var description: String {
        "[\(owner):\(animal)]"
    }
    
    public let owner: Owner
    public let animal: Animal
    
    /// Initializer of the class
    /// - Parameters:
    ///   - owner: Owner of the piece
    ///   - animal: Animal of the piece
    public init(withOwner owner: Owner, andAnimal animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
}
