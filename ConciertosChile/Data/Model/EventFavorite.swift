//
//  Calendar.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 21-01-24.
//

import Foundation
import SwiftData


@Model
final class EventFavorite {
    
    @Attribute(.unique) var id: UUID
    var name : String
    var date : String
    var title : String
    var month : String
    var url: String
    var web: String
    var time : Date?
    
    init(id: UUID = UUID(),name: String,date: String,title: String,month: String ,url: String,web: String, time: Date? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.title = title
        self.month = month
        self.url = url
        self.web = web
        self.time = time
    }
    
    static func example() -> EventFavorite {
        let event =  EventFavorite(name: "Domingo - Morrissey", date: "11 ", title: "Morrissey se presenta en vivo el próximo 21 de septiembre de 2023 15 de febrero de 2024 en el Movistar Arena de Santiago de Chile en el marco de su gira que celebra los 40 años de su destacada carrera musical", month: "Nov", url: "https://walkingstgo.cl/wp-content/uploads/2023/09/Morrissey-40-anos-de-Morrissey-Movistar-Arena-21.09.2023-NEW-WEB.jpg", web: "https://walkingstgo.cl/40-years-of-morrissey-en-el-movistar-arena-de-santiago-de-chile-15-de-febrero-de-2024/")
        return event
    }
}


