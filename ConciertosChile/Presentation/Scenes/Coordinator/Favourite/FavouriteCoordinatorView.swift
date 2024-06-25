//
//  FavouriteCoordinatorView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

struct FavouriteCoordinatorView: View {

    private let factory: FavouriteViewFactory
    @ObservedObject private var coordinator: FavouriteCoordinator

    init(_ coordinator: FavouriteCoordinator, factory: FavouriteViewFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeFavouriteView(coordinator: coordinator)
                .navigationDestination(for: FavouriteCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: FavouriteCoordinator.Screen) -> some View {
       
    }
}
