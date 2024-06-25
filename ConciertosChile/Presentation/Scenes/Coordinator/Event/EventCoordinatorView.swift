//
//  EventCoordinatorView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

struct EventCoordinatorView: View {

    private let factory: EventViewFactory
    @ObservedObject private var coordinator: EventCoordinator

    init(_ coordinator: EventCoordinator, factory: EventViewFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeEventView(coordinator: coordinator)
                .navigationDestination(for: EventCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: EventCoordinator.Screen) -> some View {
       
    }
}
