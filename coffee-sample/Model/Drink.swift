//
//  Drink.swift
//  coffee-sample
//
//  Created by Natalie Agus on 5/9/23.
//

import Foundation

struct Drink: Equatable, Hashable {
    let name: String
    let imageName: String
    let price: Float
    let calories: Int
    let sweetnessLevel: Int
    let weight: Int
}
