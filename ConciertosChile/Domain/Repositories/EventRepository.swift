//
//  EventRepository.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import Foundation

protocol EventRepository {
    func getEventList() async throws -> [EventModel]
    func getNewsList() async throws -> [EventModel]
}

