//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/11.
//

import Foundation

class EmojiMemoryGame :ObservableObject{
    
    @Published private (set) var gameData: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["🫥","🤪","🙃","🚗","🚕","🚙","🛻","🚃","🚘","🚇"]
        
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
    }
    
   
}
