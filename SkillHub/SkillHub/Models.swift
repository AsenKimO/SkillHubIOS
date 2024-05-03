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
}

extension User {
    let dummyData = User(
        id: 1,
        name: ""
    )
}
