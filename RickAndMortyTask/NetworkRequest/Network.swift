//
//  Network.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

class Network {
    
    static var countFull = Int()
    
    static var heroes = Heroes()
    
    func request(complition: (()->Void)) {
        complition()
    }
    
//MARK: - Parsing info Heroes
    class func infoHeroes (complition: @escaping ()->()) {
        for (id) in 1...493 {
            let urlString = "https://rickandmortyapi.com/api/character/\(id)"
            
            guard let url = URL(string: urlString) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard error == nil else { return }
                
                do {
                    let info = try JSONDecoder().decode(Hero.self, from: data)
                    
                    heroes.append(info)
                    
                    DispatchQueue.main.async {
                        complition()
                    }
                    
                }catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
