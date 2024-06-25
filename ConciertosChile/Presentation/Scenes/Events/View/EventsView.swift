//
//  ContentView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import SwiftUI

struct EventsView: View {
    @StateObject var viewModel = HomeViewModel(fetchEventListUseCase: FetchEventListUseCase(eventRepository: EventRepositoryImplementation()))
    
    @State private var timeOfTheDay = ""
    
    var body: some View {
        contentView
            .redacted(if: viewModel.state == .loading)
            .backgroundColor()
            .onAppear {
                viewModel.handle(.onAppear)
            }
    }
    
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()

        case .loading:
            EmptyView()

        case .loaded(let viewData):
            listView(
                eventItems: viewData.eventItems
            )
        case .error(let message):
            ErrorView(message: message)
        }
    }
}

private extension EventsView {

    func listView(eventItems: [EventModel]) -> some View {
        List {
            Section {
                ForEach(eventItems) { event in
                    SummaryView(event: event)
                } 
                .onTapGesture {
                    timeOfTheDay.count
                }
            }
        }
        .overlay {
            if eventItems.isEmpty{
                ContentUnavailableView {
                    Label("No Pets", systemImage: "pawprint.circle")
                } description: {
                    Text("Try to add a new Pet.")
                }
            }
        }
        .refreshable {
            viewModel.handle(.onAppear)
        }
        .listStyle(.insetGrouped)
        .listRowSpacing(15)
        .navigationTitle("\(timeOfTheDay)")
        .onAppear {
            let hour = Calendar.current.component(.hour, from: Date())
            
            switch hour {
            case 6..<12 : timeOfTheDay = "Buenos dias ☀️"
            case 12..<19 : timeOfTheDay = "Buenas tardes 🌤️"
            default: timeOfTheDay = "Buenas noches 🌑"
            }
        }
    }
}

#Preview {
    EventsView()
}

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
