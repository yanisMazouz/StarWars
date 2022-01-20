//
//  Vehicles.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation


struct VehiclesResponse : Codable{
    let results : [Vehicles]?
}

struct Vehicles : Codable, StarWarsObject {
    var name : String?
    let model : String?
    let manufacturer : String?
    let costInCredits : String?
    let length : String?
    let maxAtmospheringSpeed : String?
    let crew : String?
    let passengers : String?
    let cargoCapacity :  String?
    let consumables : String?
    let vehicleClass : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case vehicleClass = "vehicle_class"
        case url
    }
    
    func getListInfos() -> [(String,String)]{
        var listInfo : [(String,String)] = []
        if let name = name {
            listInfo.append(("Nom", name))
        }
        if let model = model {
            listInfo.append(("Modèle", model))
        }
        if let manufacturer = manufacturer {
            listInfo.append(("Fabricant", manufacturer))
        }
        if let costInCredits = costInCredits {
            listInfo.append(("Prix", costInCredits))
        }
        if let length = length {
            listInfo.append(("Taille", length))
        }
        if let maxAtmospheringSpeed = maxAtmospheringSpeed {
            listInfo.append(("Vitesse atmosphérique max", maxAtmospheringSpeed))
        }
        if let crew = crew {
            listInfo.append(("Equipage", crew))
        }
        if let passengers = passengers {
            listInfo.append(("Passager", passengers))
        }
        if let cargoCapacity = cargoCapacity {
            listInfo.append(("Capacité du cargo", cargoCapacity))
        }
        if let consumables = consumables {
            listInfo.append(("Mise en service", consumables))
        }
        if let vehicleClass = vehicleClass {
            listInfo.append(("Classe du véhicule", vehicleClass))
        }
        return listInfo
    }
}


