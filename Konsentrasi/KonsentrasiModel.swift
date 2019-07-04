//
//  KonsentrasiModel.swift
//  Konsentrasi
//
//  Created by Jonathan Filbert on 04/07/19.
//  Copyright © 2019 Jonathan Filbert. All rights reserved.
//

import Foundation

class Konsentrasi{
//    create an empty array of cards
    var cards = [Card]()
    //    card flip method
    func chooseCard(at index: Int){
        //            TODO
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }
    }

//    Constructor add x pairs of cards to array
    init(numberOfCardPairs: Int){
        print("almost there!!")
        for _ in 1...numberOfCardPairs{
            let tempCard = Card()
            cards.append(tempCard)
        }
        
//        Shuffle the cards
        cards = cards.shuffled()
}
}
