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
        
        
        Network.parsCountPages() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        Network.infoHeroes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Network.infoDict.count
        //return Network.nameFull.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNames = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        let arrayNames = Network.nameFull[indexPath.row]
//        cellNames.textLabel?.text = arrayNames
        let arrayNames = Network.infoDict
        
        return cellNames
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
