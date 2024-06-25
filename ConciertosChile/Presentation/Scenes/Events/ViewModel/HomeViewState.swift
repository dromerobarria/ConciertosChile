//
//  HomeViewEvent.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

enum HomeViewEvent {
    case onAppear
}

enum HomeViewState: Equatable {
    case idle
    case loading
    case error(String)
    case loaded(ViewData)
    
    struct ViewData: Equatable {
        var eventItems: [EventModel]
    }
}
