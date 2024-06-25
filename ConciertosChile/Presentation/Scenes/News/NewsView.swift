//
//  ContentView.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import SwiftUI

    struct NewsView: View {
        @ObservedObject var webViewModel = WebViewModel(url: "https://sonarfm.cl/sonar/category/musica-1")
        
        var body: some View {
            NavigationView {
                ZStack {
                    WebViewContainer(webViewModel: webViewModel)
                    if webViewModel.isLoading {
                       
                    }
                }
                .navigationBarTitle(Text(webViewModel.title), displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    webViewModel.shouldGoBack.toggle()
                }, label: {
                    if webViewModel.canGoBack {
                        Image(systemName: "arrow.left")
                            .frame(width: 44, height: 44, alignment: .center)
                            .foregroundColor(.black)
                    } else {
                        EmptyView()
                            .frame(width: 0, height: 0, alignment: .center)
                    }
                })
                )
            }
        }
    }
