//
//  Encode.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

struct Encode {
    public init() { }
    
    public static func encode(_ a: Animal) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(a)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        } catch {
            print("Erreur lors de l'encodage JSON : \(error)")
        }
    }
}
