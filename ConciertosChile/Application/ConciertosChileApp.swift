//
//  ConciertosChileApp.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import SwiftUI
import SwiftData

@main
struct ConciertosChileApp: App {
    private let appFactory = AppFactory()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(
                screenFactory: ScreenFactory(appFactory: appFactory),
                coordinator: AppCoordinator()
            )
            .onAppear {
                NetworkMonitor.shared.startMonitoring()
            }
        }
        .modelContainer(for: [EventModel.self, EventFavorite.self])
    }
}
