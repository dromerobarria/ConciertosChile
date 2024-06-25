//
//  EventsViewModel.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import Foundation

final class NewsViewModel: ViewModel {
    @Published private(set) var state: NewsViewState
    private let fetchEventListUseCase: FetchEventListUseCase

    init(
        fetchEventListUseCase: FetchEventListUseCase
    ) {
        state = .idle
        self.fetchEventListUseCase = fetchEventListUseCase
    }

    func handle(_ event: NewsViewEvent) {
        switch event {
        case .onAppear:
            Task { await retrieveNews() }
        }
    }
}

private extension NewsViewModel {

    func fetchNews() async throws -> NewsViewState.ViewData {
        let news = try await fetchEventListUseCase.executeNews()
        return .init(newsItems: news)
    }

    func retrieveNews() async {
        do {
            let news = try await fetchNews()
            state = .loaded(news)
        } catch {
            state = .error("\(error.localizedDescription)")
        }
    }
    
}
