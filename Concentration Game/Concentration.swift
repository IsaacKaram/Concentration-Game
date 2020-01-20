//
//  Concentration.swift
//  Concentration Game
//
//  Created by User on 3/12/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

struct Concentration
{
   private(set) var cards = [Card]()
   private var indexOfOneAndOnlyFacedUpCard : Int? {
        get{
            return cards.indices.filter{cards[$0].isFacedUp}.oneAndOnlyOne
        }
        set{
            for index in cards.indices{
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
   mutating func chooseCard(at index : Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at : \(index)) ,chosen index not in Cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard , matchIndex != index{
                //check if card match
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            }else{
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfpairsOfCards : Int){
        assert(numberOfpairsOfCards > 0, "Concentration.init(\(numberOfpairsOfCards)) , you must have at least one pair of cards")
        for _ in 1...numberOfpairsOfCards{
            let card = Card()
            cards += [card , card]
        }
        
        // TODO: Shuffle the cards
        cards.shuffle()
    }
}

extension Collection{
    var oneAndOnlyOne : Element? {
        return count == 1 ? first : nil
    }
}
