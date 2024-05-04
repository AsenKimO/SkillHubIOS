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
            website: "https://www.helpinghands.org/",
            image_url: "https://i.imgur.com/ag86Gm8.jpeg",
            products:[
                Product(
                    name: "Shipping",
                    price: 24,
                    description: "We offer a convenient solution for college students during dorm move-ins by handling the shipping and unloading of packages. Whether it's textbooks, bedding, or electronics, our team ensures timely delivery and hassle-free unloading, allowing students to focus on settling into their new space without the stress of logistics."
                ),
                Product(
                    name: "Shipping + Packaging",
                    price: 50,
                    description: "We offer comprehensive service designed to streamline the process of sending items securely and efficiently. We carefully packaging to ensure items arrive intact. With convenient pickup options and a range of shipping choices, we provide peace of mind for both senders and recipients, making shipping hassle-free."
                )]
        ),
        User(
            name: "Touchdown the Bear",
            title: "Touchdown Appearance",
            email: "touchdownbear@cornell.edu",
            website: "https://cornell.edu/",
            image_url: "https://i.imgur.com/YHd42v5.jpeg",
            products:[
                Product(
                    name: "Bear Appearance",
                    price: 45,
                    description: "Introducing Touchdown the Bear Experience! Bring the spirit of Cornell University to your event with a special appearance by Touchdown the Bear, the beloved mascot. Perfect for rallies, fundraisers, or alumni gatherings, this iconic bear mascot will energize your event and create unforgettable memories for attendees of all ages."
                )]
        ),
        User(
            name: "Code Sweats",
            title: "CS Tutoring",
            email: "netid@cornell.edu",
            website: "https://www.cs.cornell.edu/",
            image_url: "https://imgur.com/KwEqbIg",
            products:[
                Product(
                    name: "Tutoring",
                    price: 50,
                    description: "We offer personalized tutoring sessions led by experienced Cornell students who excel in the field. Whether you're struggling with algorithms, debugging, or coding languages, our tutors provide one-on-one guidance tailored to your learning style and pace."
                )]
        ),
        User(
            name: "Really Good Singer, I swear",
            title: "I'll serenade anyone for $20",
            email: "singer@cornell.edu",
            website: "https://mediocremelodies.com/",
            image_url:"https://imgur.com/KwEqbIg",
            products:[
                Product(
                    name: "Seranade",
                    price: 20,
                    description: "You pick the song, the person, and the location, and I will sing to them for 20 dollars!"
                )]
        ),
        User(
            name: "Mary Doe",
            title: "Digital Painting of your pet",
            email: "marydoesart@gmail.com",
            website: "marydoesart.com",
            image_url:"https://imgur.com/KwEqbIg",
            products:[
                Product(
                    name: "Pet Painting",
                    price: 100,
                    description: "As a fellow college student and passionate artist, I can bring your pet's unique personality to life through vibrant colors and intricate details. Simply provide a photo of your pet, and I will create a one-of-a-kind digital painting that you can cherish forever. Perfect for dorm room decor, gifts for pet-loving friends, or a special keepsake of your four-legged companion."
                )]
        )]
}
