//
//  MemoryGame.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/11.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    init(numberOfPairCards: Int, cardContentFactory: (Int) -> CardContent) {
//        cards = Array<Card>()
        cards = []
        for pairIndex in 0 ..< numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    private(set) var cards: [Card]

    private var indexOfTheOnlyOneFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    mutating func choose(card: Card) {
        print("card chosen \(card)")
//        if let chosenIndex = index(of: card){

        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyOneFaceUpCard = chosenIndex
            }
        }
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
