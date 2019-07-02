//
//  ViewController.swift
//  Konsentrasi
//
//  Created by Jonathan Filbert on 02/07/19.
//  Copyright © 2019 Jonathan Filbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    How many cards have been flipped
    var flipCount: Int = 0 {
        didSet{
            numberLabel.text = "\(flipCount)"
        }
    }

    //    Array of the cards
    @IBOutlet var cardArray: [UIButton]!
    
//    Array of emoji
    var emojiArray = ["👻","🎃","👻","🎃"]
    
//    this method will be invoked everytime the card is touched
    @IBAction func touchCard(_ sender: UIButton) {
//        Find the card index in the array
        let currentIndex = cardArray.firstIndex(of: sender)
        flipCard(withEmoji: emojiArray[currentIndex!], on: sender)
    }
    
//    Count label
    @IBOutlet weak var numberLabel: UILabel!

    
//    Count increment method
    func increment(label: UILabel, value:Int){
        flipCount+=1
    }
    
    //    Card flip helper method
    func flipCard (withEmoji emoji:String, on
        button:UIButton){
        print("\(emoji) called!")
        //        If the button already has an emoji title
        if button.currentTitle == emoji{
            //            Cha 0nge the button bg to solid blue
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        }
            //        If the button already has blue color, change it to its normal one
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        increment(label: numberLabel, value: flipCount)
    }
}

