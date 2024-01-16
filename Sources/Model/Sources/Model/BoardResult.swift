//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 15/01/2024.
//

import Foundation

public enum BoardResult {
    case unknown
    case ok
    case failed(reason: BoardFailingReason)
}
