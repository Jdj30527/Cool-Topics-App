//
//  Concentration.swift
//  Concentration
//
//  Created by John on 4/23/18.
//  Copyright © 2018 John Jefferies. All rights reserved.
//

import Foundation

class Concenration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyOneFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                //chick if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        var unShuffledCards: [Card] = []
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            unShuffledCards += [card, card]
        }
        //TODO: Shuffle the cards
        while !unShuffledCards.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(unShuffledCards.count)))
            let card = unShuffledCards.remove(at: randomIndex)
            cards.append(card)
        }
    }
}
