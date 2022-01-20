//
//  Films.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation

struct FilmsResponse : Codable{
    let results : [Films]?
}


struct Films : Codable, StarWarsObject {
    var name : String?
    let director : String?
    let producer : String?
    let releaseDate : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey{
        case name = "title"
        case director
        case producer
        case releaseDate = "release_date"
        case url
    }
    
    func getListInfos() -> [(String,String)]{
        var listInfo : [(String,String)] = []
        if let name = name {
            listInfo.append(("Nom", name))
        }
        if let director = director {
            listInfo.append(("Directeur", director))
        }
        if let producer = producer {
            listInfo.append(("Producteur", producer))
        }
        if let releaseDate = releaseDate {
            listInfo.append(("Date de sortie", releaseDate))
        }
        return listInfo
    }
}

