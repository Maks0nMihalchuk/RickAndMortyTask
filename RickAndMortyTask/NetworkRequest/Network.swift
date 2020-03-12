//
//  Network.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

class Network {
    
    static var countPages = Int()
    static var allNames = AllNameHerous(results: [])
    static var lastName = AllNameHerous(results: [])
    static var fullNames = [String]()

    func request(complition: (()->Void)) {
        complition()
    }
    
//MARK: - Parsing the number of pages
    class func parsCountPages(complition: @escaping ()->())  {
        let urlString = "https://rickandmortyapi.com/api/character/?page=1"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                                        
            guard let data = data else { return }
            guard error == nil else { return }
        
            do {
                let pages = try JSONDecoder().decode(CountPages.self, from: data)
                countPages = pages.info.pages
                //print(countPages)
                DispatchQueue.main.async {
                    complition()
                }
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
//MARK: - We get the names of the heroes through the request
    class func parsNamesHeroes(complition: @escaping ()->()) {
        
        for page in 1...24 {
            let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                guard error == nil else { return }
                
                do {
                    let name = try JSONDecoder().decode(AllNameHerous.self, from: data)
                    Network.allNames.results = name.results
                    
                    for i in 0..<20 {
                        
                        fullNames.append(Network.allNames.results[i].name)
                        print(fullNames)
                    }
                }catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
    }
    
    class func parsNeamesHero (complition: @escaping ()->()) {
        let urlString = "https://rickandmortyapi.com/api/character/?page=25"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in ()
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let lastName = try JSONDecoder().decode(AllNameHerous.self, from: data)
                Network.lastName = lastName
                
                for i in 0..<13 {
                    fullNames.append(Network.lastName.results[i].name)
                    print(fullNames)
                }
                
            }catch let error {
                print(error)
            }
        }.resume()
    }
}

