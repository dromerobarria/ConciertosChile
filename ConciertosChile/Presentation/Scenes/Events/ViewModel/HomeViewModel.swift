//
//  EventsViewModel.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import Foundation

final class HomeViewModel: ViewModel {
    @Published private(set) var state: HomeViewState
    private let fetchEventListUseCase: FetchEventListUseCase

    init(
        fetchEventListUseCase: FetchEventListUseCase
    ) {
        state = .idle
        self.fetchEventListUseCase = fetchEventListUseCase
    }

    func handle(_ event: HomeViewEvent) {
        switch event {
        case .onAppear:
            Task { await retrieveEvents() }
        }
    }
}

private extension HomeViewModel {

    func fetchEvent() async throws -> HomeViewState.ViewData {
        let events = try await fetchEventListUseCase.execute()
        return .init(eventItems: events)
    }

    func retrieveEvents() async {
        do {
            let movies = try await fetchEvent()
            state = .loaded(movies)
        } catch {
            state = .error("\(error.localizedDescription)")
        }
    }
    
}
