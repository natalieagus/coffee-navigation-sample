//
//  CoffeeView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import SwiftUI

struct CoffeeView: View {
    var onSelectReset: () -> ()
    let coffee: Drink
    let otherCoffees: [Drink]
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                Image(coffee.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                //  .border(Color.pink)

                Text(coffee.name)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
            }

            List {
                Section {
                    DetailedRow(title: "Price", detail: "$ \(coffee.price)")
                    DetailedRow(title: "Calories", detail: "\(coffee.calories) cal")
                    DetailedRow(title: "Sweetness Level", detail: coffee.sweetnessLevel == 0 ? "🤮" : String(repeating: "🍬", count: coffee.sweetnessLevel))
                    DetailedRow(title: "Weight", detail: "\(coffee.weight) oz")
                } header: {
                    Text("Details")
                } footer: {
                    Text("©2023 Sunbucks Coffee All ☕️ Reserved")
                }

                Section(header: Text("Other Coffee")) {
                    ForEach(otherCoffees, id: \.name) { coffee in
                        NavigationLink(value: coffee, label: {
                            Text(coffee.name)
                                .font(.subheadline.weight(.medium))
                        })
                    }
                }
            }.navigationTitle(Text(coffee.name))
                .navigationBarTitleDisplayMode(.inline)

            Button(action: {
                showingAlert = true
            }, label: {
                Text("Reset")
            }).alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Are you sure you want to reset your order?"),
                    message: Text("This decision is final"),
                    primaryButton: .destructive(Text("Reset")) {
                        onSelectReset()
                    },
                    secondaryButton: .cancel()
                )
            }.padding(.bottom)
        }
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView(onSelectReset: {}, coffee: coffees[2], otherCoffees: coffees)
    }
}
