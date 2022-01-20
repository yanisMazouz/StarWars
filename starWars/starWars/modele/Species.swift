//
//  Species.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation


struct SpeciesResponse : Codable{
    let results : [Species]?
}

struct Species : Codable, StarWarsObject {
    var name : String?
    let classification : String?
    let designation: String?
    let averageHeight : String?
    let skinColors: String?
    let hairColors: String?
    let eyeColors : String?
    let averageLifespan : String?
    let homeworld : String?
    let language : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case url
    }
    
    func getListInfos() -> [(String,String)]{
        var listInfo : [(String,String)] = []
        if let name = name {
            listInfo.append(("Nom", name))
        }
        if let classification = classification {
            listInfo.append(("Classification", classification))
        }
        if let designation = designation {
            listInfo.append(("Désignation", designation))
        }
        if let averageHeight = averageHeight {
            listInfo.append(("Taille moyenne", averageHeight))
        }
        if let skinColors = skinColors {
            listInfo.append(("Couleur de la peau", skinColors))
        }
        if let hairColors = hairColors {
            listInfo.append(("Couleur de cheveux", hairColors))
        }
        if let eyeColors = eyeColors {
            listInfo.append(("Couleur des yeux", eyeColors))
        }
        if let averageLifespan = averageLifespan {
            listInfo.append(("Durée de vie moyenne", averageLifespan))
        }
        if let language = language {
            listInfo.append(("Langue", language))
        }
        return listInfo
    }
    
}



