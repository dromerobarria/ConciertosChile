//
//  ViewModifiers.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import SwiftUI

struct BackgroundColorViewModifier: ViewModifier {

    let color: Color

    func body(content: Content) -> some View {
        ZStack {
            color
                .ignoresSafeArea()

            content
        }
    }
}

extension View {
    func backgroundColor(_ color: Color = Color.white) -> some View {
        modifier(BackgroundColorViewModifier(color: color))
    }
}

extension View {
    func redacted(if condition: Bool) -> some View {
        redacted(reason: condition ? .placeholder : [])
    }
}
