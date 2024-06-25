//
//  FavouriteCoordinator.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import Foundation

final class FavouriteCoordinator: Coordinator {
    
    enum Screen: Routable {
        case EventDetails(EventFavorite)
    }
    
    @Published var navigationPath = [Screen]()
    
    init() {}
}

extension FavouriteCoordinator: FavouriteCoordinatorProtocol {
    func EventDetails(_ event: EventFavorite) {
        navigationPath.append(.EventDetails(event))
    }
}

