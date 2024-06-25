//
//  SummaryView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 22-01-24.
//

import Foundation
import SwiftUI
import SwiftData

struct SummaryFavoriteView: View {
    @Bindable var event: EventFavorite
    @Environment(\.openURL) private var openURL
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 10){
                AsyncImage(url: URL(string: event.url)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 100)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    case .failure:
                        Image(systemName: "photo").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 100)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                HStack(alignment: .top) {
                    VStack{
                        RoundedRectangle(cornerRadius: 23)
                            .frame(width: 74, height: 74)
                            .foregroundColor(Color.blue)
                            .overlay(
                                VStack {
                                    Text(event.date)
                                        .font(.system(size: 35, weight: .regular))
                                        .foregroundColor(.white)
                                    Text(event.month)
                                        .foregroundColor(.white)
                                }
                            )
                            .padding(.trailing ,4)
                        
                    }
                    .padding(.trailing ,4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.name)
                            .font(.system(size: 20, weight: .semibold))
                        Text(event.title)
                            .font(.subheadline)
                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        
                        
                    }
                }
                .padding(.vertical ,6)
                
                HStack(spacing: 40) {
                    Button(action: { withAnimation {
                        modelContext.delete(event)
                    }}) {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .contentTransition(.symbolEffect(.replace))
                    .frame(width: 10, height: 10)
                  
                    Menu {
                        Button {
                            openURL(URL(string: event.web)!)
                        } label: {
                            Label("Web \(event.name)", systemImage: "gear")
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    func checkWeb() {
        openURL(URL(string: event.web)!)
    }
}
