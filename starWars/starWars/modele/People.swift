//
//  People.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation


struct PeopleResponse : Codable{
    let results : [People]?
}
struct People : Codable, StarWarsObject {
    var name : String?
    let height : String?
    let mass : String?
    let hairColor : String?
    let skinColor : String?
    let eyeColor : String?
    let birthYear : String?
    let gender : String?
    let homeworld : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case url
    }
    
    func getListInfos() -> [(String,String)]{
        var listInfo : [(String,String)] = []
        if let name = name {
            listInfo.append(("Nom", name))
        }
        if let height = height {
            listInfo.append(("Taille", height))
        }
        if let mass = mass {
            listInfo.append(("Poid", mass))
        }
        if let hairColor = hairColor {
            listInfo.append(("Couleur de cheveux", hairColor))
        }
        if let skinColor = skinColor {
            listInfo.append(("Couleur de la peau", skinColor))
        }
        if let eyeColor = eyeColor {
            listInfo.append(("Couleur des yeux", eyeColor))
        }
        if let birthYear = birthYear {
            listInfo.append(("Année de naissance", birthYear))
        }
        return listInfo
    }
}


