//
//  OwnerTests.swift
//  
//
//  Created by Vincent Astolfi on 09/01/2024.
//

import XCTest
@testable import Model

final class OwnerTests: XCTestCase {
    // Test if the CustomStringConvertible implementation is working well
    func ownerDisplayTest() throws {
        assert(Owner.noOne.description == "x")
        assert(Owner.player1.description == "1")
        assert(Owner.player2.description == "2")
    }
}
