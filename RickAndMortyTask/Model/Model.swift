//
//  Model.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

struct CountPages: Codable {
    var info: Pages
}
struct Pages: Codable {
    var pages: Int
}

struct AllNameHerous: Codable {
    var results: [NameHeroes]
}
struct NameHeroes: Codable {
    var name: String
}
