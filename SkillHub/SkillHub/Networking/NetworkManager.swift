//
//  NetworkManager.swift
//  A4
//
//  Created by Library User on 4/26/24.
//

import Foundation
import Alamofire

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private init() {  }

    /// Endpoint for recipes
    private let recipeEndpoint: String = "https://api.jsonbin.io/v3/b/64d033f18e4aa6225ecbcf9f?meta=false"
    
    /// Decoder
    private let decoder = JSONDecoder()

    // MARK: - Requests
    func fetchRecipes(completion: @escaping ([User]) -> Void) {
        
        AF.request(recipeEndpoint, method: .get)
            .validate()
            .responseDecodable(of: [User].self, decoder: decoder) { response in
                switch response.result {
                case .success(let recipes):
                    completion(recipes)
                case .failure(let error):
                    print(error)
                    print("Error in NetworkManager.fetchAllRecipes: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
}
