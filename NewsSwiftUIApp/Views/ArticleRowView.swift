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
// set image
            AsyncImage(url: article.imageURL) { Phase in
                switch Phase {
                case .empty:

                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }

                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)

                case .failure:

                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }

                @unknown default:
                    fatalError()

                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()

            VStack(alignment: .leading, spacing: 8) {
                // set title
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                // set description
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)

                HStack {
                    // Date
                    Text(article.captionText)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption)

                    Spacer()

                    Button(action: {
                        print("vvv")
                    }) {
                        Image(systemName: "bookmark")
                    }
                    .buttonStyle(.bordered)

                    Button(action: {
                        presentShareSheet(url: article.articleURL)
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(.bordered)
                }
            }
           // .background(Color.yellow)
            .padding([.bottom, .horizontal])
        }
    }
}

extension View {
    func presentShareSheet(url: URL) {
let activityVC = UIActivityViewController(activityItems: [ url], applicationActivities: nil)

        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.rootViewController?.present(activityVC, animated: true)
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}
