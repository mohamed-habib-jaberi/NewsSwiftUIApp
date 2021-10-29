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
    case med
}

enum Med{
    case emptymed
    case successmed

}

@MainActor
class ArticleNewsViewModel: ObservableObject {

   // let articles: [Article]

    @Published var selectedCategory: Category

    @Published var phase = DataFetchPhase<[Article]>.empty

    @Published var medd = Med.emptymed

    private let newsAPI = NewsAPI.shared

    init(articles: [Article]? = nil, selectedCategory: Category = .general){

        if let articles = articles {
            self.phase = .success(articles)
            self.medd = .successmed
        }else{
            //self.phase = .empty
            self.medd = .emptymed
        }
        self.selectedCategory = selectedCategory
    }

    func loadArticles() async {
        phase = .empty

        do{
            let articles = try await newsAPI.fetch(from: selectedCategory)
            phase = .success(articles)
        }catch{
            phase = .failure(error)
        }
    }

}
