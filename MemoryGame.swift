//
//  MemoryGame.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/11.
//

import Foundation

struct MemoryGame<CardContent> {
    init (numberOfPairCards: Int , cardContentFactory: (Int) -> CardContent){
       cards = Array<Card>()
        for pairIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:pairIndex*2 , content:content))
            cards.append(Card(id:pairIndex*2+1 , content: content))
        }
    }
    
    var cards: Array<Card>
    
    func choose(card: Card){
        print("card chosen \(card)")
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = true
        var isChoosen: Bool = false
        var content: CardContent
    }
}
