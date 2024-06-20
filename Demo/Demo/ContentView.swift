//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-06-07.
//

import EmojiKit
import SwiftUI

struct ContentView: View {
    
    @State private var selection = Emoji.GridSelection(emoji: .init("🙄"), category: .smileysAndPeople)

    @FocusState var focusState1
    @FocusState var focusState2

    var body: some View {
        NavigationStack {
            VStack {
                grid(.vertical)
                    .focused($focusState1)
                Divider()
                grid(.horizontal)
                    .focused($focusState2)
            }
        }
        .emojiGridStyle(.small)
    }
}

private extension ContentView {
    
    func fillStyle(_ isSelected: Bool) -> AnyShapeStyle {
        isSelected ? .init(.selection) : .init(.clear)
    }
    
    func grid(_ axis: Axis.Set) -> some View {
        EmojiScrollGrid(
            axis: axis,
            categories: .all,
            selection: $selection,
            frequentEmojiProvider: MostRecentEmojiProvider(),
            action: { print($0) },
            section: { $0.view },
            item: { $0.view }
        )
    }
}

#Preview {
    ContentView()
}
