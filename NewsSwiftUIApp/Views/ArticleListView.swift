//
//  ArticleListView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 28/10/2021.
//

import SwiftUI

struct ArticleListView: View {

    let articles: [ Article]

    var body: some View {
        List{
            ForEach(articles){ article in
                ArticleRowView(article: article)
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)

        }
        .listStyle(.plain)
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: Article.previewData)
    }
}
