//
//  ConcentraitionGame.swift
//  Concentration
//
//  Created by d vasylenko on 21.02.2022.
//

import Foundation

class ConcentraitionGame {

    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else{
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
             
        }
    }
    
        init(numberOfPairsOfCards: Int) {
            for _ in 1...numberOfPairsOfCards {
                let card = Card()
                cards += [card, card]
                
            }
        }
    

}
