//
//  Appetizer.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Test Appetize",
        description: "This is the description for my appetizer. It is good",
        price: 9.99,
        imageURL: "IMG_5677",
        calories: 99,
        protein: 99,
        carbs: 999)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
