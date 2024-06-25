//
//  EventRepositoryImpl.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 29-01-24.
//

import Foundation
import SwiftSoup
import SwiftUI

final class EventRepositoryImplementation: @unchecked Sendable {

    typealias Item = (text: String, html: String)
    private var events: [EventModel] = []
    
    private var loadedMovies = [EventModel]()
    init() { }
}

extension EventRepositoryImplementation: EventRepository {
    func getNewsList() async throws -> [EventModel] {
        guard NetworkMonitor.shared.isConnected else { throw NetworkError.noConnect }
        let events = try await downloadHTMLNews()
        return events
    }
    
    func getEventList() async throws -> [EventModel] {
        guard NetworkMonitor.shared.isConnected else { throw NetworkError.noConnect }
        let events = try await downloadHTML()
        return events
    }
    
    func getEvent(name: String) -> Bool {
        for event in events {
            if event.name == name {
                return true
            }
        }
        return false
    }
    
    func downloadHTML() async throws -> [EventModel] {
        if let url = URL(string: "https://walkingstgo.cl/categoria/conciertos/")  {
            do {
                let html = try String.init(contentsOf: url)
                let document = try SwiftSoup.parse(html)
                let events = try await parse(document: document)
                return events
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }else {
            throw NetworkError.invalidResponse
        }
    }
    
    func parse(document: Document) async throws -> [EventModel]{
        do {
            let elements: Elements = try document.select("a[href^=https")
            for element in elements {
                let text = try element.text()
                var titleArray = text.components(separatedBy: " ")
                let dateArray = titleArray[0].components(separatedBy: "/")
                titleArray.remove(at: 0)
                let time = dateArray.joined(separator: "-")
                let name = titleArray.joined(separator: " ")
                let web = titleArray.joined(separator: "-")
                    .replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: ".", with: "")
                    .replacingOccurrences(of: "&", with: "")
                    .replacingOccurrences(of: "--", with: "-")
                    .replacingOccurrences(of: "-–-", with: "-")
                    .lowercased()
                    .folding(options: .diacriticInsensitive, locale: .current)
                
                if dateArray.count > 1 &&  titleArray.count > 1{
                    let html = try element.outerHtml()
                    let image = html.slice(from: "srcset=\"", to: " 640w")
                    
                    if !getEvent(name: name) {
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = .init(identifier: "es_ES")
                        let dateString = time
                        dateFormatter.dateFormat = "dd/M/yyyy"
                        let dateFormat = dateFormatter.date(from: dateString)
                        
                        let newItem = EventModel(name: name, date: dateArray[0], title: text, month: dateArray[1], url: image ?? "", web: "https://walkingstgo.cl/" + web, favorite: false, time: dateFormat)
                        
                        events.append(newItem)
                    }
                }
            }
            return events
        } catch _ {
            throw NetworkError.invalidResponse
        }
    }
    
    
    func downloadHTMLNews() async throws -> [EventModel] {
        if let url = URL(string: "https://www.agendamusical.cl/")  {
            do {
                let html = try String.init(contentsOf: url)
                let document = try SwiftSoup.parse(html)
                let events = try await parseNews(document: document)
                return events
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }else {
            throw NetworkError.invalidResponse
        }
    }
    
    func parseNews(document: Document) async throws -> [EventModel]{
        do {
            let elements: Elements = try document.select("[title]")
            for element in elements {
                let text = try element.text()
                print(text)
//                var titleArray = text.components(separatedBy: " ")
//                let dateArray = titleArray[0].components(separatedBy: "/")
//                titleArray.remove(at: 0)
//                let time = dateArray.joined(separator: "-")
//                let name = titleArray.joined(separator: " ")
//                let web = titleArray.joined(separator: "-")
//                    .replacingOccurrences(of: "+", with: "")
//                    .replacingOccurrences(of: ".", with: "")
//                    .replacingOccurrences(of: "&", with: "")
//                    .replacingOccurrences(of: "--", with: "-")
//                    .replacingOccurrences(of: "-–-", with: "-")
//                    .lowercased()
//                    .folding(options: .diacriticInsensitive, locale: .current)
//                
//                if dateArray.count > 1 &&  titleArray.count > 1{
//                    let html = try element.outerHtml()
//                    let image = html.slice(from: "srcset=\"", to: " 640w")
//                    
//                    if !getEvent(name: name) {
//                        let dateFormatter = DateFormatter()
//                        dateFormatter.locale = .init(identifier: "es_ES")
//                        let dateString = time
//                        dateFormatter.dateFormat = "dd/M/yyyy"
//                        let dateFormat = dateFormatter.date(from: dateString)
//                        
//                        let newItem = EventModel(name: name, date: dateArray[0], title: text, month: dateArray[1], url: image ?? "", web: "https://walkingstgo.cl/" + web, favorite: false, time: dateFormat)
//                        
//                        events.append(newItem)
//                    }
//                }
            }
            return events
        } catch _ {
            throw NetworkError.invalidResponse
        }
    }
}
