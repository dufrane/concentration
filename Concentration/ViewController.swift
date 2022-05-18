//
//  ViewController.swift
//  Concentration
//
//  Created by d vasylenko on 21.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentraitionGame(numberOfPairsOfCards: (buttonCollection.count+1)/2)
    
    var touches = 0 {
        didSet{
            touchLable.text = "Touches: \(touches)"
        }
    }
    
    
 
    var emojiCollection = ["🦊","🐷","🐯","🐰","🐴","🦅","🐶","🐻","🦁","🐺","🦉","🐵","🐧","🐼","🐭","🐱"]
    
    var emojiDictionary = [Int:String] ()
    
    func emojiIdentifier (for card: Card) -> String {
//        if emojiDictionary[card.identifier] != nil {
//            emojiDictionary[card.identifier]!
//        }
//        else{
//            return "?"
//        }
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "?"  //another type of unwrapping
    }
    
    
    func updateViewFromModel () {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle (emojiIdentifier(for: card ), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLable: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel ()
        }
    }
    
    
}

