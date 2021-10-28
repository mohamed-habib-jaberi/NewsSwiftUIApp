//
//  Article.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 27/10/2021.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article {
    let source: Source

    let title: String
    let url: String
    let publishedAt: Date

    let author: String?
    let description: String?
    let urlToImage: String?

    var authorText: String {
        author ?? ""
    }

    var descriptionText: String {
        description ?? ""
    }

    var articleURL: URL {
        URL(string: url)!
    }

    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }

    //computed property
    var captionText: String {
        "\(source.name) . \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }

}

extension Article: Codable{}
extension Article: Equatable{}
extension Article: Identifiable{
    var id: String {url}
}

struct Source {
    let name: String
}

extension Source: Codable{}
extension Source: Equatable{}

extension Article {
    static var previewData: [Article] {

        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        
        let data = try! Data(contentsOf: previewDataURL)

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)

        return apiResponse.articles ?? []

    }
}
