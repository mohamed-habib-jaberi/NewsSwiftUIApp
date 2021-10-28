//
//  Category.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 28/10/2021.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health

    var text: String{
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable{
    var id: Self {self}
}
