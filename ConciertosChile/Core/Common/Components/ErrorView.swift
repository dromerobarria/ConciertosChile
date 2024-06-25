//
//  ErrorView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import SwiftUI

struct ErrorView: View {

    let message: String

    var body: some View {
        VStack {
            VStack(spacing: Constants.contentSpacing) {
                Image(.background)
                    .resizable()
                    .frame(
                        width: Constants.imageSize,
                        height: Constants.imageSize
                    )

                Text(LocalizedStringKey(message))
                    .font(.body.weight(.medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .offset(y: Constants.offsetY)
        .backgroundColor()
    }

    private enum Constants {
        static let offsetY: CGFloat = -50
        static let imageSize: CGFloat = 320
        static let contentSpacing: CGFloat = 45
    }
}
