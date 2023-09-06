//
//  ExampleView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import SwiftUI

enum Food: String {
    case Burger = "🍔"
    case Taco = "🌮"
    case Noodle = "🍜"
    case Chicken = "🍗"
}

struct FoodMenuItem: Equatable, Hashable {
    var icon: Food
}

struct FullMenuView: View {
    var foodMenu: [FoodMenuItem] = [FoodMenuItem(icon: Food.Burger), FoodMenuItem(icon: Food.Taco), FoodMenuItem(icon: Food.Noodle), FoodMenuItem(icon: Food.Chicken)]

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Food")) {
                    ForEach(foodMenu, id: \.icon) { foodItem in
                        NavigationLink(value: foodItem.icon, label: {
                            Text(foodItem.icon.rawValue)
                        })
                    }
                }
                Section(header: Text("Drinks")) {
                    ForEach(drinks, id: \.name) { drink in
                        NavigationLink(value: drink, label: {
                            Text(drink.name)
                        })
                    }
                }
            }
            // two destinations
            // for parameter: which type of navigation link value we want to use
            .navigationDestination(for: Food.self) { foodItem in
                EmojiView(moji: foodItem.rawValue)
            }
            .navigationDestination(for: Drink.self, destination: { drink in
                DrinkView(drink: drink)
            })
            .navigationTitle(Text("🌚 D'Moon Bistro"))
        }
    }
}

struct FullMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FullMenuView()
    }
}
