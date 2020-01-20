//
//  Card.swift
//  Concentration Game
//
//  Created by User on 3/12/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

struct Card : Hashable
{
    func hash(into hasher: inout Hasher){
        hasher.combine(identifier.hashValue)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
   var isFacedUp = false
    var isMatched = false
   private var identifier : Int
    
   private static var identifierFactory = 0
   private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
       self.identifier = Card.getUniqueIdentifier()
    }
}
