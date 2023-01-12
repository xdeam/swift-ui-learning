//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ForEach(0..<6){ _ in
                HStack  {
                    ForEach(gameViewModel.cards){ card in
                        CardView(card:card).onTapGesture {
                            gameViewModel.choose(card: card)
                        }
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
                .foregroundColor(Color.orange)
                .font(Font.largeTitle)
            }
        }
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame())
    }
}
