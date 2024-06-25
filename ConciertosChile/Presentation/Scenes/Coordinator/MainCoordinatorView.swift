//
//  MainCoordinatorView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

import SwiftUI

struct MainCoordinatorView: View {

    enum Tab {
        case home
        case favorites
        case live
        case news
    }

    @State private var selectedTab = Tab.home

    private let factory: ScreenFactory
    private let eventCoordinator: EventCoordinator
    private let favouriteCoordinator: FavouriteCoordinator
    private let newsCoordinator: NewsCoordinator
    private let liveCoordinator: LiveCoordinator

    init(factory: ScreenFactory) {
        self.factory = factory

        eventCoordinator = .init()
        favouriteCoordinator = .init()
        newsCoordinator = .init()
        liveCoordinator = .init()
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            EventCoordinatorView(eventCoordinator, factory: factory)
                .tabItem {
                    Label("Eventos", systemImage: Constants.shareplay)
                }
                .tag(Tab.home)
            
            FavouriteCoordinatorView(favouriteCoordinator, factory: factory)
                .tabItem {
                    Label("Favoritos", systemImage: Constants.heart)
                }
                .tag(Tab.favorites)
            
            NewsCoordinatorView(newsCoordinator, factory: factory)
                .tabItem {
                    Label("News", systemImage: Constants.newspaper)
                }
                .tag(Tab.news)
            
            LiveCoordinatorView(liveCoordinator, factory: factory)
                .tabItem {
                    Label("Streaming", systemImage: Constants.live)
                }
                .tag(Tab.live)
        }
        .tint(.appAccent)
        .onAppear {
            setupTabBar()
        }
    }

    private enum Constants {
        static let shareplay = "shareplay"
        static let heart = "heart"
        static let newspaper = "newspaper"
        static let live = "person.3.fill"
    }

    @MainActor private func setupTabBar() {
        UITabBar.appearance().tintColor = UIColor(resource: .appAccent)
        UITabBar.appearance().isTranslucent = true

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    }
}
