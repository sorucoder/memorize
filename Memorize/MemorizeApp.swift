//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marcus on 1/18/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private static var themes: Array<EmojiMemoryGame.Theme> = [
        EmojiMemoryGame.Theme(
            name: "Halloween",
            emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"],
            numberOfPairsOfCards: 10,
            color: .orange
        ),
        EmojiMemoryGame.Theme(
            name: "Food and Drink",
            emojis: ["🍇", "🥑", "🍞", "🍙", "🍦", "🥛"],
            numberOfPairsOfCards: 4,
            color: .yellow
        ),
        EmojiMemoryGame.Theme(
            name: "Animals and Nature",
            emojis: ["🐒", "🦃", "🐊", "🐌", "🌸", "🪷", "🌹", "🌺"],
            numberOfPairsOfCards: 6,
            color: .green
        ),
        EmojiMemoryGame.Theme(
            name: "Sports",
            emojis: ["⚽", "⚾", "🏀", "🏐", "🏈", "🎾"],
            numberOfPairsOfCards: 5,
            color: .red
        ),
        EmojiMemoryGame.Theme(
            name: "Games and Toys",
            emojis: ["🎱", "🔫", "🪁", "🪀", "🎮", "🕹️", "🕹️", "🧩"],
            numberOfPairsOfCards: 7,
            color: .indigo
        ),
        EmojiMemoryGame.Theme(
            name: "Flags",
            emojis: ["🇺🇸", "🇦🇷", "🇦🇺", "🇧🇬", "🇧🇴", "🇨🇦", "🇨🇭", "🇩🇪", "🇩🇴", "🇪🇨", "🇪🇸", "🇫🇷", "🇬🇧", "🇬🇷", "🇨🇳"],
            numberOfPairsOfCards: 12,
            color: .gray
        )
    ]
    
    @StateObject var game = EmojiMemoryGame(themes: themes)
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
