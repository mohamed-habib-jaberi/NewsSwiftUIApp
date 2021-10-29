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

    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
        }
    }


}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
