//
//  ModalView.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}



struct SheetViewRoot: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct SheetViewRoot_Previews: PreviewProvider {
    static var previews: some View {
        SheetViewRoot()
    }
}
