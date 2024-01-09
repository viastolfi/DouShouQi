//
//  OwnerTests.swift
//  
//
//  Created by Vincent Astolfi on 09/01/2024.
//

import XCTest
@testable import Model

final class OwnerTests: XCTestCase {
    func ownerDisplayTest() throws {
        assert(Owner.noOne.rawValue == "x")
        assert(Owner.player1.rawValue == "1")
        assert(Owner.player2.rawValue == "2")
    }
}
