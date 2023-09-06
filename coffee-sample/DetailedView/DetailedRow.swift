//
//  DetailedRow.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import Foundation
import SwiftUI

struct DetailedRow: View {
    let title: String
    var detail: String? = nil

    var body: some View {
        HStack {
            Text(title)
            if detail?.isEmpty == false {
                Spacer()
                if let detail {
                    Text(detail).foregroundColor(Color(.secondaryLabel))
                }
            }
        }
    }
}
