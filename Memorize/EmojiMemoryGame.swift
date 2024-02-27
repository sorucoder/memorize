//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcus E. W. Germano, IV on 2/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>
    private var themes: Array<EmojiMemoryGame.Theme>
    
    init(themes: Array<EmojiMemoryGame.Theme>) {
        let theme = themes.randomElement()!
        let emojis = theme.emojis.shuffled()
        
        self.themes = themes
        self.theme = theme
        self.game = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in emojis[pairIndex] }
        
        self.shuffle()
    }
    
    struct Theme {
        var name: String
        var emojis: Array<String>
        var numberOfPairsOfCards: Int
        var color: Color
    }
    
    var theme: EmojiMemoryGame.Theme
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    var score: Int {
        get { return game.score }
    }
    
    // MARK: - Intents
    
    func new() {
        self.theme = self.themes.randomElement()!
        let emojis = self.theme.emojis.shuffled()
        self.game = MemoryGame<String>(numberOfPairsOfCards: self.theme.numberOfPairsOfCards) { pairIndex in emojis[pairIndex] }
        self.shuffle()
    }
    
    func shuffle() {
        self.game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        self.game.choose(card)
    }
}
