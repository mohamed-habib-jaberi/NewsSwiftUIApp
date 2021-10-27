//
//  ArticleRowView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 27/10/2021.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL) { Phase in
                switch Phase {
                case .empty:

                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }

                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)

                case .failure:

                    VStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }

                @unknown default:
                    fatalError()

                }
            }
            .frame( minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }.listStyle(.plain)
        }
    }
}
