//
//  Models.swift
//  SkillHub
//
//  Created by Library User on 5/2/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let website: String
    let image_url: String
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let name: String
    let price: String
    let description: String
}

struct DummyData {
    let dummyUsers: [User] = []
}
