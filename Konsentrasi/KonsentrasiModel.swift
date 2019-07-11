//
//  KonsentrasiModel.swift
//  Konsentrasi
//
//  Created by Jonathan Filbert on 04/07/19.
//  Copyright © 2019 Jonathan Filbert. All rights reserved.
//

import Foundation

class Konsentrasi {
//    create an empty array of cards
    private(set) var cards = [Card]()
    //    card flip method

    private var indexOfOnlyCard: Int? {
//        Get the index of the ONLY face up card
        get {
            var foundIndex: Int?
            for cardIndex in cards.indices{
                if cards[cardIndex].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = cardIndex
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
//  Set the selected card isFaceUp to true and the other to false
        set(newValue) {
            for cardIndex in cards.indices{
                cards[cardIndex].isFaceUp = (cardIndex == newValue)
            }
        }
    }
    func chooseCard(at index: Int) {
//        TODO

        //        If card is not in the list, crash
        assert(cards.indices.contains(index),"KonsentrasiModel \(index) crashes :(")
//        If you choose an unmatched card
        if !cards[index].isMatched {
//            If you choose an unmatched card that's different than the current face up card
            if let matchIndex = indexOfOnlyCard, index != matchIndex {
//                Check if card matched
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }
//                Cards are not matched
                else {
//                Turns all the other cards face down
                    indexOfOnlyCard = index
            }
        }
    }

//    Constructor add x pairs of cards to array
    init(numberOfCardPairs: Int) {
        
        assert(numberOfCardPairs > 0, "Card pair has to be greater than zero")
        for _ in 1...numberOfCardPairs {
            let tempCard = Card()
            cards.append(tempCard)
            cards.append(tempCard)
        }

//        Shuffle the cards
        cards = cards.shuffled()
    }
}
