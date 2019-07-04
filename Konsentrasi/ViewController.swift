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
    lazy var game = Konsentrasi(numberOfCardPairs: cardArray.count)
    
    //    Array of the cards
    @IBOutlet var cardArray: [UIButton]!
    
//    How many cards have been flipped
    var flipCount: Int = 0 {
        didSet{
            numberLabel.text = "\(flipCount)"
        }
    }
    
//    this method will be invoked everytime the card is touched
    @IBAction func touchCard(_ sender: UIButton) {
//        Find the card index in the array
        let currentIndex = cardArray.firstIndex(of: sender)
        game.chooseCard(at: currentIndex!)
        updateViewFromModal()
    }
    
//    Count label
    @IBOutlet weak var numberLabel: UILabel!

    
//    Count increment method
    func increment(label: UILabel, value:Int){
        flipCount+=1
    }
    
//    Update the view after the card is chosen
    func updateViewFromModal(){
        for index in cardArray.indices{
            let button = cardArray[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                increment(label: numberLabel, value: flipCount)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
    }
    
    var emojiArray = ["👻","🎃","👻","🎃"]
    func emoji(for card: Card) -> String {
        return "?"
    }
    
}

