//
//  NewsTabView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 29/10/2021.
//

import SwiftUI

struct NewsTabView: View {

    @StateObject var articleNewsVM = ArticleNewsViewModel()

    private var articles: [ Article] {

        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }

    // MARK: - overlayView
    @ViewBuilder
    private var overlayView: some View {
        switch articleNewsVM.phase {
        case .empty: ProgressView()
            
        case .success(let articles) where articles.isEmpty:

            EmptyPlaceholderView(text: "No articles", image: nil)

        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                // TODO: refresh the news API

            }
        default: EmptyView()
        }
    }

    // MARK: - body
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .onAppear(perform: {
                    async{
                        await articleNewsVM.loadArticles()
                    }
                })
                .navigationTitle(articleNewsVM.selectedCategory.text)
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
