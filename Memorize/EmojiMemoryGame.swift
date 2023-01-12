//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/11.
//

import Foundation

class EmojiMemoryGame :ObservableObject{
    
    @Published private var gameData: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["🫥","🤪","🙃"]
        
        return MemoryGame(numberOfPairCards: emojis.count){ pairIndex  in
            emojis[pairIndex]
        }
    }
    
    
    //MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card>  {
        return gameData.cards
    }
    
    //MARK: Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        gameData.choose(card: card)
        gameData.cards[index(of: card)].isFaceUp = !gameData.cards[index(of: card)].isFaceUp
    }
    
    func index(of aCard: MemoryGame<String>.Card)->Int{
        for card in cards {
            if (card.id == aCard.id){
                return aCard.id
            }
        }
        return 0
        //TODO: - modify the return value
    }
}
