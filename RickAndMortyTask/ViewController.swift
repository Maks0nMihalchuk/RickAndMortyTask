//
//  ViewController.swift
//  RickAndMortyTask
//
//  Created by maks on 11.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Network.parsCountPages() {
            DispatchQueue.main.async {
                
            }
        }
        Network.parsNamesHeroes() {
            DispatchQueue.main.async {
                
            }
        }
        Network.parsNeamesHero() {
            DispatchQueue.main.async {
                
            }
        }
    }
    
    
}

