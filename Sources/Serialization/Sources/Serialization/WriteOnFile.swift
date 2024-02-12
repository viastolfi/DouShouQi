//
//  WriteOnFile.swift
//
//
//  Created by Vincent Astolfi on 12/02/2024.
//

import Foundation

struct WriteOnFile {
    public static func writeJson(_ json: String) {
        do {
            let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
            let filePath = downloadsDirectory.appendingPathComponent("test.json")
            try json.write(to: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("Error encoding or writing JSON to file: \(error)")
        }
    }
}
