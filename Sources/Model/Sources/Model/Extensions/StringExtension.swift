//
//  StringExtension.swift
//
//
//  Created by Vincent Astolfi on 30/01/2024.
//

import Foundation

extension String {
    public var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
