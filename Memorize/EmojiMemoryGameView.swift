//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    @State var count = 5

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(gameViewModel.cards[0 ..< count]) { card in
                        CardView(card)
                            .onTapGesture {
                                gameViewModel.choose(card: card)
                            }
                            .aspectRatio(2 / 3, contentMode: .fit)
                    }
                    // .padding([.horizontal,.vertical],5)
                }
                .padding(.horizontal)
                .foregroundColor(Color.orange)
            }

            Spacer()

            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal, 10)
        }
    }

    var add: some View {
        Button(action: {
            if count < gameViewModel.cards.count {
                count += 1
            }

        }, label: {
            Image(systemName: "plus.circle")
        })
    }

    var remove: some View {
        Button(action: {
            if count > 1 {
                count -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")

        })
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(Font.largeTitle)
            }
            else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame())
    }
}
