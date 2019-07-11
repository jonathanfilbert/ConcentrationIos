//
//  ViewController.swift
//  Konsentrasi
//
//  Created by Jonathan Filbert on 02/07/19.
//  Copyright © 2019 Jonathan Filbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //    Create a new game instance
    private lazy var game = Konsentrasi(numberOfCardPairs: (cardArray.count / 2))
    
    //    Array of the cards
    @IBOutlet private var cardArray: [UIButton]!
    
    //    How many cards have been flipped
    private(set) var flipCount: Int = 0 {
        didSet {
            numberLabel.text = "\(flipCount)"
        }
    }
    
    //    this method will be invoked everytime the card is touched
    @IBAction private func touchCard(_ sender: UIButton) {
        //        Find the card index in the array
        let currentIndex = cardArray.firstIndex(of: sender)
        game.chooseCard(at: currentIndex!)
        updateViewFromModal()
    }
    
    //    Count label
    @IBOutlet private weak var numberLabel: UILabel!
    
    
    //    Count increment method
    private func increment(label: UILabel, value: Int) {
        flipCount += 1
    }
    
    //    Update the view after the card is chosen
    private func updateViewFromModal() {
        for index in cardArray.indices {
            let button = cardArray[index]
            let card = game.cards[index]
            if(card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                increment(label: numberLabel, value: flipCount)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0): #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
    }
    
    private var emojiArray = ["👻", "👽", "🎃", "🐷", "🦊", "🐶", "🐸", "🐨", "🐮", "🦐"]
    
    private var emojiDictionary: Dictionary = Dictionary<Int, String>()
    
    private func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            if emojiArray.count > 0 {
                emojiDictionary[card.identifier] = emojiArray.remove(at: emojiArray.count.arc4random)
            }
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
}

//Generate a random number from 0 to a certain int
extension Int {
    var arc4random: Int {
        //        If the int is > 0, return a random number from 0 to that int
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
            //            If the int is < 0 return a random - number
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
            //            If the int is zero, return zero
        else {
            return 0
        }
    }
}

