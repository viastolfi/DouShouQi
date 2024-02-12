//
//  Encode.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation
import Model

public struct Encode {    
    public static func encode(_ b: Board) {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let jsonData = try jsonEncoder.encode(b)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                WriteOnFile.writeJson(jsonString)
            }
        } catch {
            print("Erreur lors de l'encodage JSON : \(error)")
        }
    }
}
