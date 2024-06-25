//
//  ScreenFactoryProtocols.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

@MainActor
protocol EventViewFactory {
    func makeEventView(coordinator: EventCoordinatorProtocol) -> EventsView
}


@MainActor
protocol FavouriteViewFactory {
    func makeFavouriteView(coordinator: FavouriteCoordinatorProtocol) -> FavouriteView
}

@MainActor
protocol LiveViewFactory {
    func makeLiveView(coordinator: LiveCoordinatorProtocol) -> LiveView
}


@MainActor
protocol NewsViewFactory {
    func makeNewsView(coordinator: NewsCoordinatorProtocol) -> NewsView
}


@MainActor
protocol EventDetailsViewFactory {
    func makeEventDetailsView(
        event: EventModel
    ) -> DetailView
}


@MainActor
protocol EventFavouriteDetailsViewFactory {
    func makeEventFavouriteDetailsView(
        event: EventFavorite
    ) -> DetailFavoriteView
}
