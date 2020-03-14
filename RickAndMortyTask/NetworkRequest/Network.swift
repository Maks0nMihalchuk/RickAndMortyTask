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
    
    static var nameFull = [String]()
    static var statusFull = [String]()
    static var speciesFull = [String]()
    static var typeFull = [String]()
    static var genderFull = [String]()
    static var imgFull = [String]()
    
    static var infoDict = [[String: [String]]]()

    static var objectArray = [Object]()
    
    func request(complition: (()->Void)) {
        complition()
    }
    
//MARK: - Parsing the number of pages
    class func parsCountPages(complition: @escaping ()->())  {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                                        
            guard let data = data else { return }
            guard error == nil else { return }
        
            do {
                let count = try JSONDecoder().decode(AllCount.self, from: data)
                countFull = count.info.count

                DispatchQueue.main.async {
                    complition()
                }
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
//MARK: - Parsing info Heroes
    class func infoHeroes (complition: @escaping ()->()) {
        
        for id in 1...493 {
            let urlString = "https://rickandmortyapi.com/api/character/\(id)"
            
            guard let url = URL(string: urlString) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard error == nil else { return }
                
                do {
                    let info = try JSONDecoder().decode(Heroes.self, from: data)
                    
                    infoDict.append([info.name : [info.status,info.species, info.gender, info.image]])
                    print(infoDict)
                    
                }catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
