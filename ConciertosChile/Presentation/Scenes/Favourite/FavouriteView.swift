//
//  ContentView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import SwiftUI
import SwiftData

struct FavouriteView: View {
    @Query(sort: [.init(\EventFavorite.name) ,.init(\EventFavorite.date, order: .reverse)], animation: .bouncy)
    var events: [EventFavorite] = []
    
    
    @State private var timeOfTheDay = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(events) { event in
                        NavigationLink(destination: DetailFavoriteView(event: event) ) {
                            SummaryFavoriteView(event: event)
                        }
                    }
                }
            }
            .overlay(Group {
                if events.isEmpty {
                    Text("Oops, No existen conciertos...")
                }
            })
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
