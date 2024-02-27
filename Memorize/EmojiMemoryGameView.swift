//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus on 1/18/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.custom("Veranda", size: 34))
            Text(game.theme.name)
            Text("Score: \(game.score)")
            ScrollView {
                cards.animation(.default, value: game.cards)
            }
            Button("New Game") {
                game.new()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(game.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(game.theme.color)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init (_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(
            game: EmojiMemoryGame(
                themes: [
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
            )
        )
    }
}
