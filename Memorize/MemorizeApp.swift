//
//  MemorizeApp.swift
//  Memorize
//
//  Created by kwinter king on 2023/1/10.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: game)
        }
    }
}
