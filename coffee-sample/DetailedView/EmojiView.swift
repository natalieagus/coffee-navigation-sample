//
//  EmojiView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import SwiftUI

struct EmojiView: View {
    let moji: String
    @State private var swing = false
    @State private var enlarge = false
    var body: some View {
        Text(moji)
            .font(.system(size: enlarge ? 100 : 80)).rotationEffect(.degrees(swing ? -20 : 20), anchor: swing ?
                .bottomLeading : .bottomTrailing)
            .task {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    swing.toggle()
                }
                withAnimation(.easeInOut(duration: 0.5).repeatForever()) {
                    enlarge.toggle()
                }
            }
    }
}

struct EmojiView_previews: PreviewProvider {
    static var previews: some View {
        EmojiView(moji: Food.Burger.rawValue)
    }
}
