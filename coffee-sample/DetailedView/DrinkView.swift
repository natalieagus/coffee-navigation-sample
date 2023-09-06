//
//  DrinkView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import Foundation
import SwiftUI

struct DrinkView: View {
    var drink: Drink
    @State private var rotationDegrees: Double = 0

    var body: some View {
        VStack {
            EmojiView(moji: "🍹").frame(width: 300, height: 300)
            List {
                Section {
                    DetailedRow(title: "Price", detail: "$ \(drink.price)")
                    DetailedRow(title: "Calories", detail: "\(drink.calories) cal")
                    DetailedRow(title: "Sweetness Level", detail: drink.sweetnessLevel == 0 ? "🤮" : String(repeating: "🍬", count: drink.sweetnessLevel))
                    DetailedRow(title: "Weight", detail: "\(drink.weight) oz")
                } header: {
                    Text("Details")
                } footer: {
                    Text("©2023 Sunbucks Drinks All 🍹 Reserved")
                }
            }.navigationTitle(Text(drink.name))
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView(drink: drinks[0])
    }
}
