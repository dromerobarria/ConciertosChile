//
//  AppFactory.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import Foundation

final class AppFactory {
    private lazy var EventRepository:EventRepositoryImplementation = {
        return EventRepositoryImplementation()
    }()
}

// MARK: - Event

extension AppFactory {

    func makeFetchProfileUseCase() -> FetchEventListUseCase {
        FetchEventListUseCase(eventRepository: EventRepository)
    }
}

