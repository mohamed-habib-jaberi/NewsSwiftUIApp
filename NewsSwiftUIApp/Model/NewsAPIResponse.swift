//
//  NewsAPIResponse.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 27/10/2021.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]

    let code: String?
    let message: String?
}
