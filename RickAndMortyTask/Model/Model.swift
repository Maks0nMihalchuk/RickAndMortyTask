//
//  Model.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

//MARK: - We get information about character

typealias Heroes = [Hero]
struct Hero: Codable {
    
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    var origin: Location
    var location: Location
}

struct Location: Codable {
    var name: String
}
