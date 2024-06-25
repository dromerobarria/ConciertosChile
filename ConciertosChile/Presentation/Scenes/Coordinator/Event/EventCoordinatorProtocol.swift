//
//  EventCoordinatorProtocol.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import Foundation

@MainActor
protocol EventCoordinatorProtocol {
    func EventDetails(_ event: EventModel)
}

