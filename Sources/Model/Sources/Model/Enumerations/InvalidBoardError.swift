//
//  File.swift
//  
//
//  Created by Vincent Astolfi on 22/01/2024.
//

import Foundation

public enum InvalidBoardError : Error {
    case badDimensions(row: Int,column: Int)
    case badCellType(cellType: CellType,row: Int,column: Int)
    case multipleOccurenceOfSamePiece(piece: Piece)
    case pieceWithNoOwner(piece: Piece)
    case pieceNotAllowedOnThisCell(piece: Piece,cell: Cell)
}
