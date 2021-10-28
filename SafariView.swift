//
//  SafariView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 28/10/2021.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable{
    typealias UIViewControllerType = SFSafariViewController

    let url:URL
    func makeUIViewController(context: Context) -> SFSafariViewController {
        
        SFSafariViewController(url: url)

    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }







}
