//
//  Card.swift
//  Konsentrasi
//
//  Created by Jonathan Filbert on 04/07/19.
//  Copyright © 2019 Jonathan Filbert. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //    List of all used identifiers
    private static var identifierList = 0
    
    //    Constructor
    init() {
        self.identifier = Card.getIdentifier()
        self.isMatched = false
        self.isFaceUp = false
    }
    
    
    
    //    Generate a unique ID everytime called
    private static func getIdentifier() -> Int {
        identifierList += 1
        return identifierList
    }
}
