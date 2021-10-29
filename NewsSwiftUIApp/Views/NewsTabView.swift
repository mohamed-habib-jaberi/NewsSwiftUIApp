//
//  NewsTabView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 29/10/2021.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView {

        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
