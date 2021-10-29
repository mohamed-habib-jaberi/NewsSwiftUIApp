//
//  ArticleNewsViewModel.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 29/10/2021.
//

import SwiftUI

enum DataFetchPhase<T>{
    case empty
    case success(T)
    case failure(Error)
}

@MainActor
class ArticleNewsViewModel: ObservableObject {

   // let articles: [Article]

    @Published var selectedCategory: Category

    @Published var phase = DataFetchPhase<[Article]>.empty
    private let newsAPI = NewsAPI.shared

    init(articles: [Article]? = nil, selectedCategory: Category = .general){

        if let articles = articles {
            self.phase = .success(articles)
        }else{
            self.phase = .empty
        }
        self.selectedCategory = selectedCategory
    }

    func loadArticles() async {
        phase = .empty

        do{
            let articles = try await newsAPI.fetch(from: selectedCategory)
            phase = .success(articles)
//            DispatchQueue.main.async {
//
//            }
        }catch{
            phase = .failure(error)
        }
    }

}
