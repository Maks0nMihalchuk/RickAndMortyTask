//
//  Model.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

//MARK: - count pages
struct AllCount: Codable {
    var info: Count
}
struct Count: Codable {
    var count: Int
}

//MARK: - We get information about character

struct Heroes: Codable {
    
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    
}

struct Object {
    var nameObject: String
    var infoObject: [String]
}

