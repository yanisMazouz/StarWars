//
//  Planets.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation

struct PlanetsResponse : Codable{
    let results : [Planets]?
}

struct Planets : Codable, StarWarsObject {
    var name : String?
    let rotationPeriod : String?
    let orbitalPeriod : String?
    let diameter : String?
    let climate : String?
    let gravity : String?
    let terrain : String?
    let surfaceWater : String?
    let population : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case url
    }
    
    func getListInfos() -> [(String,String)]{
        var listInfo : [(String,String)] = []
        if let name = name {
            listInfo.append(("Nom", name))
        }
        if let rotationPeriod = rotationPeriod {
            listInfo.append(("Période de rotation", rotationPeriod))
        }
        if let orbitalPeriod = orbitalPeriod {
            listInfo.append(("Période orbitale", orbitalPeriod))
        }
        if let climate = climate {
            listInfo.append(("Climat", climate))
        }
        if let diameter = diameter {
            listInfo.append(("Diamètre", diameter))
        }
        if let gravity = gravity {
            listInfo.append(("Gravité", gravity))
        }
        if let terrain = terrain {
            listInfo.append(("Terrain", terrain))
        }
        if let surfaceWater = surfaceWater {
            listInfo.append(("Surface de l'eau", surfaceWater))
        }
        if let population = population {
            listInfo.append(("Population", population))
        }
        return listInfo
    }

}
