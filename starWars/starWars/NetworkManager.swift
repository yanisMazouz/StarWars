//
//  NetworkManager.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static func fechPeople(text : String, completion : @escaping ([People]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/people/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: PeopleResponse.self){ resp in
                    switch resp.result {
                        case .success(let peopleResponse):
                        completion(peopleResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechPlanets(text : String, completion : @escaping ([Planets]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/planets/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: PlanetsResponse.self){ resp in
                    switch resp.result {
                        case .success(let planetsResponse):
                        completion(planetsResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechStarships(text : String, completion : @escaping ([Starships]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/starships/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: StarshipsResponse.self){ resp in
                    switch resp.result {
                        case .success(let starshipsResponse):
                        completion(starshipsResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechSpecies(text : String, completion : @escaping ([Species]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/species/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: SpeciesResponse.self){ resp in
                    switch resp.result {
                        case .success(let speciesResponse):
                        completion(speciesResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechVehicles(text : String, completion : @escaping ([Vehicles]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/vehicles/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: VehiclesResponse.self){ resp in
                    switch resp.result {
                        case .success(let vehiclesResponse):
                        completion(vehiclesResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechFilms(text : String, completion : @escaping ([Films]?) -> Void){
        let parameters : Parameters = ["search" : text]
        AF.request("https://swapi.dev/api/films/", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: FilmsResponse.self){ resp in
                    switch resp.result {
                        case .success(let filmsResponse):
                        completion(filmsResponse.results)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
    
    static func fechPlanet(url : String, completion : @escaping (Planets) -> Void){
        AF.request(url, method: .get)
            .validate(statusCode: [200])
            .responseDecodable(of: Planets.self){ resp in
                    switch resp.result {
                        case .success(let planetsResponse):
                        completion(planetsResponse)
                            break
                        case .failure(let aferror):
                            print(aferror.localizedDescription)
                    }
            }
    }
}
