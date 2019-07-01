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
    var flipCount: Int = 0
    
    //    Cat card method
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "😸", on: sender)
    }
    
    //    Ghost card
    
    @IBAction func ghostCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    
    //    Card flip helper method
    func flipCard (withEmoji emoji:String, on
        button:UIButton){
        print("\(emoji) called!")
        //        If the button already has an emoji title
        if button.currentTitle == emoji{
            //            Change the button bg to solid blue
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        }
            //        If the button already has blue color, change it to its normal one
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        }
    }
}

