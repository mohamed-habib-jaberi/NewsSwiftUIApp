//
//  NewsAPI.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 28/10/2021.
//

import Foundation

struct NewsAPI {

    static let shared = NewsAPI()

    // MARK: - Initialisation

    private init(){}



    
    private let apiKey = "apikey"
    private let session = URLSession.shared

    private let jsonDecoder: JSONDecoder = {
        print("test")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    // Get list of article from the API
    /// - Parameters:
    ///   - category: The `Category` instance
    func fetch(from category: Category ) async throws -> [ Article]{

        let url = generateNewsURL(from: category)
        let (data, response) = try await session.data(from: url)

        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad response")
        }

        switch response.statusCode{
        case(200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }

        default:
            throw generateError( description: "A serveur error occured")
        }
    }

    // Generate error from api
    /// - Parameters:
    ///   - code: The `Int` instance
    ///   - description: The `String` instance
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }

    // Generate url from Category
    /// - Parameters:
    ///   - category: The `Category` instance
    private func generateNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
}
