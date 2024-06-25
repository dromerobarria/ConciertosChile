//
//  ScreenFactory.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

final class ScreenFactory: EventCoordinatorFactory,
                           FavouriteCoordinatorFactory,
                           NewsCoordinatorFactory,
                           LiveCoordinatorFactory {
    
    

    private let appFactory: AppFactory

    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}

// MARK: - EventViewFactory

extension ScreenFactory: EventViewFactory {
    func makeEventView(coordinator: EventCoordinatorProtocol) -> EventsView {
        let view = EventsView()
        return view
    }
}


// MARK: - FavouriteViewFactory

extension ScreenFactory: FavouriteViewFactory {
    func makeFavouriteView(coordinator: FavouriteCoordinatorProtocol) -> FavouriteView {
        let view = FavouriteView()
        return view
    }
}

// MARK: - HomeViewFactory

extension ScreenFactory: NewsViewFactory {
    func makeNewsView(coordinator: NewsCoordinatorProtocol) -> NewsView {
        let view = NewsView()
        return view
    }
}

// MARK: - HomeViewFactory

extension ScreenFactory: LiveViewFactory {
    func makeLiveView(coordinator: LiveCoordinatorProtocol) -> LiveView {
        let view = LiveView()
        return view
    }
}

// MARK: - MovieDetailsFactory

extension ScreenFactory: EventDetailsViewFactory, EventFavouriteDetailsViewFactory {
    func makeEventDetailsView(event: EventModel) -> DetailView {
        let view = DetailView(event: event)
        return view
    }
    
    func makeEventFavouriteDetailsView(event: EventFavorite) -> DetailFavoriteView {
        let view = DetailFavoriteView(event: event)
        return view
    }
}
