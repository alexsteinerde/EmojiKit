//
//  Emoji+GridItem.swift
//  EmojiKit
//
//  Created by Daniel Saidi on 2024-01-08.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Emoji {
    
    /// This view represents a standard emoji grid item view.
    ///
    /// You can style this component with the style modifier
    /// ``emojiGridItemStyle(_:)``.
    struct GridItem: View {
        
        /// Create an emoji grid item view.
        ///
        /// - Parameters:
        ///   - emoji: The emoji to show.
        ///   - isSelected: Whether or not the emoji is selected.
        public init(
            _ emoji: Emoji,
            isSelected: Bool = false
        ) {
            self.emoji = emoji
            self.isSelected = isSelected
        }
        
        /// The emoji to show.
        public var emoji: Emoji
        
        @Environment(\.emojiGridItemStyle)
        private var style
        
        /// Whether or not the emoji is selected.
        public var isSelected: Bool
        
        public var body: some View {
            Text(emoji.char)
                .clipShape(.containerRelative)
                .aspectRatio(1, contentMode: .fill)
                .selectionBackground(
                    isSelected: isSelected,
                    cornerRadius: style.cornerRadius
                )
        }
    }
}

#Preview {
    
    VStack {
        Emoji.GridItem(
            .init("😀"),
            isSelected: false
        )
        Emoji.GridItem(
            .init("🇸🇪"),
            isSelected: true
        )
    }
    .font(.largeTitle)
}
