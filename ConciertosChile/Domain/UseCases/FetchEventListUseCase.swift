//
//  FetchEventListUseCase.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import Foundation

final class FetchEventListUseCase {

    private let eventRepository: EventRepository

    init(eventRepository: EventRepository) {
        self.eventRepository = eventRepository
    }

    func execute() async throws -> [EventModel] {
        let events = try await eventRepository.getEventList()
        return events
    }
    
    func executeNews() async throws -> [EventModel] {
        let news = try await eventRepository.getNewsList()
        return news
    }
}
