//
//  ContentView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "Accent Color")
        UITabBar.appearance().unselectedItemTintColor = UIColor(.gray)
    }

    @State private var path = NavigationPath()

    var body: some View {
        TabView {
            FullMenuView().tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
            OrderCoffeeView()
                .tabItem {
                    Label("Coffee", systemImage: "cup.and.saucer.fill")
                }
            CartView()
                .tabItem {
                    Label("Checkout", systemImage: "cart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
