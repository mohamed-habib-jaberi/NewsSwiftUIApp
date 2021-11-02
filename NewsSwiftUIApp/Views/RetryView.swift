//
//  RetryView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 02/11/2021.
//

import SwiftUI

struct RetryView: View {

    let text: String
    let retryAction: () -> ()

    var body: some View {
        VStack(spacing: 8) {

            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)

            Button(action: {
                retryAction()
            }) {
                Image(systemName: "bookmark")
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An error ocurred" ){
            print("An error ocurred")
        }
    }
}
