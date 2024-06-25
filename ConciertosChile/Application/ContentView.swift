//
//  ContentView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import SwiftUI
import SwiftData


import SwiftUI

//@main
//struct ContentView: App {
//
//    private let appFactory = AppFactory()
//
//    var body: some Scene {
//        WindowGroup {
//            AppCoordinatorView(
//                screenFactory: ScreenFactory(appFactory: appFactory),
//                coordinator: AppCoordinator()
//            )
//            .onAppear {
//                NetworkMonitor.shared.startMonitoring()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
////    let modelContainer: ModelContainer
//    private let appFactory = AppFactory()
//    
////    init() {
////        do {
////            modelContainer = try ModelContainer(for: EventModel.self, EventFavorite.self)
////        } catch {
////            fatalError("Could not initialize ModelContainer")
////        }
////    }
//    
//    var body: some View {
//        WindowGroup {
//            AppCoordinatorView(
//                screenFactory: ScreenFactory(appFactory: appFactory),
//                coordinator: AppCoordinator(
//                    fetchProfileUseCase: appFactory.makeFetchProfileUseCase(),
//                    fetchFavoriteMoviesUseCase: appFactory.makeFetchFavoriteMoviesUseCase()
//                )
//            )
//            .preferredColorScheme(.dark)
//            .onAppear {
//                NetworkMonitor.shared.startMonitoring()
//            }
//        }
//        
////           TabView {
////               EventsView()
////                   .modelContainer(for:[EventModel.self, EventFavorite.self])
////                   .tabItem {
////                       Label("Conciertos", systemImage: "list.dash")
////                   }
////               FavouriteView()
////                   .modelContainer(for:[EventFavorite.self])
////                   .tabItem {
////                       Label("Favoritos", systemImage: "square.and.pencil")
////                   }
////           }
//       }
//}
