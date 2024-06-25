//
//  LiveCoordinatorLive.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

struct LiveCoordinatorView: View {

    private let factory: LiveViewFactory
    @ObservedObject private var coordinator: LiveCoordinator

    init(_ coordinator: LiveCoordinator, factory: LiveViewFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeLiveView(coordinator: coordinator)
                .navigationDestination(for: LiveCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: LiveCoordinator.Screen) -> some View {
       
    }
}
