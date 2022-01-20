//
//  StarWarsObject.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import Foundation

protocol StarWarsObject {
    var name : String? {get set}
    var url : String? {get set}
    func getListInfos() -> [(String,String)]
}
