//
//  Models.swift
//  SkillHub
//
//  Created by Library User on 5/2/24.
//

import Foundation

struct User: Codable {
    let name: String
    let title: String
    let email: String
    let website: String
    let image_url: String
    let products: [Product]
}

struct Product: Codable {
    let name: String
    let price: Float
    let description: String
}

struct DummyData {
    let dummyUsers: [User] = [
        User(
            name: "Helping Hands",
            title: "FA24 MOVE IN ASSIST",
            email: "helpinghands@.cornell.edu",
            website: "helpinghands.org",
            image_url: "https://imgur.com/a/0WFXWXj",
            products:[
                Product(
                    name: "Shipping",
                    price: 24,
                    description: "We offer a convenient solution for college students during dorm move-ins by handling the shipping and unloading of packages. Whether it's textbooks, bedding, or electronics, our team ensures timely delivery and hassle-free unloading, allowing students to focus on settling into their new space without the stress of logistics."
                ),
                Product(
                    name: <#T##String#>,
                    price: <#T##Float#>,
                    description: "We offer comprehensive service designed to streamline the process of sending items securely and efficiently. We carefully packaging to ensure items arrive intact. With convenient pickup options and a range of shipping choices, we provide peace of mind for both senders and recipients, making shipping hassle-free."
                )]
        ),
        User(
            name: "touchdown the bear",
            title: "Touchdown Sport Sub in",
            email: "touchdownbear@cornell.edu",
            website: "https://cornell.edu/",
            image_url: <#T##String#>,
            products:[
                Product(
                    name: <#T##String#>,
                    price: <#T##Float#>,
                    description: <#T##String#>
                )]
        ),
        User(
            name: <#T##String#>,
            title: <#T##String#>,
            email: <#T##String#>,
            website: <#T##String#>,
            image_url: <#T##String#>,
            products:[
                Product(
                    name: <#T##String#>,
                    price: <#T##Float#>,
                    description: <#T##String#>
                )]
        ),
        User(
            name: <#T##String#>,
            title: <#T##String#>,
            email: <#T##String#>,
            website: <#T##String#>,
            image_url: <#T##String#>,
            products:[
                Product(
                    name: <#T##String#>,
                    price: <#T##Float#>,
                    description: <#T##String#>
                )]
        ),
        User(
            name: <#T##String#>,
            title: <#T##String#>,
            email: <#T##String#>,
            website: <#T##String#>,
            image_url: <#T##String#>,
            products:[
                Product(
                    name: <#T##String#>,
                    price: <#T##Float#>,
                    description: <#T##String#>
                )]
        )]
}
