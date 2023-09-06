//
//  OrderCoffeeView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import SwiftUI

struct OrderCoffeeView: View {
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Text("What would you like to drink?")
                Section(header: Text("Coffee")) {
                    ForEach(coffees, id: \.name) { coffee in
                        NavigationLink(value: coffee, label: {
                            Text(coffee.name)
                        })
                    }
                }
            }
            .navigationDestination(for: Drink.self, destination: { coffee in
                CoffeeView(onSelectReset: { popToRoot() }, coffee: coffee, otherCoffees: coffees)
            })
            .navigationTitle(Text("🧜🏻‍♀️ Somebucks Coffee"))
        }
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct OrderCoffee_Previews: PreviewProvider {
    static var previews: some View {
        OrderCoffeeView()
    }
}
