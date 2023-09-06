//
//  CartView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import Foundation
import SwiftUI

struct CartView: View {
    @State private var selection: String? = addresses[0]

    var body: some View {
        NavigationStack {
            VStack {
                Text("💰 Damages").font(Font.title).bold()
                List(selection: $selection) {
                    Section(header: Text("Order Summary")) {
                        Text("Iced Black")
                        Text("🍔")
                    }
                    Section(header: Text("Payment Methods")) {
                        NavigationLink("Visa", destination: {
                            PlaceholderView()
                        })
                        NavigationLink {
                            PlaceholderView()
                        } label: {
                            HStack(spacing: 20) {
                                Text("Amex")
                                Image("amex").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).padding(.leading)
                            }
                        }

                        NavigationLink("MasterCard", destination: {
                            PlaceholderView()
                        })
                        NavigationLink("GrabPay", destination: {
                            PlaceholderView()
                        })
                    }

                    Section(header: Text("Shipping Address")) {
                        ForEach(addresses, id: \.self) { address in
                            Text(address)
                        }
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
