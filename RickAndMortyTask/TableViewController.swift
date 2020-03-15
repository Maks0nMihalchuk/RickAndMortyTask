//
//  TableViewController.swift
//  RickAndMortyTask
//
//  Created by maks on 12.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.infoHeroes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Network.heroes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNames = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cellNames.textLabel?.text = Network.heroes[indexPath.row].name
        
        return cellNames
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoHeroTableViewController()
        vc.hero = Network.heroes[indexPath.row]
        self.present(vc, animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
