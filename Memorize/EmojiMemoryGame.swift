//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/11.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    @Published private(set) var gameData: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = ["ðŦĨ", "ðĪŠ", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ð"]

        return MemoryGame(numberOfPairCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Access to the model

    var cards: [Card] {
        return gameData.cards
    }

    // MARK: Intent(s)

    func choose(card: Card) {
        gameData.choose(card: card)
    }
}
