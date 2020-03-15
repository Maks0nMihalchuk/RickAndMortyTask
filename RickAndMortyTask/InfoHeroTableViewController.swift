//
//  InfoHeroTableViewController.swift
//  RickAndMortyTask
//
//  Created by maks on 15.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class InfoHeroTableViewController: UITableViewController {
   
    var name = ""
    var hero: Hero? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ImgInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "imgCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "speciesCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "typeCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "genderCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "originCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "locationCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: InfoTableViewCell? = nil
        var imgCell: ImgInfoTableViewCell? = nil
        switch indexPath.row {
        case 0:
            let url = URL(string: hero?.image ?? "")
            if let data = try? Data(contentsOf: url!) {
                imgCell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as? ImgInfoTableViewCell
                imgCell?.imgLable.image = UIImage(data: data)
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Name:"
            cell?.detailLabel.text = hero?.name ?? ""
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "speciesCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Species:"
            cell?.detailLabel.text = hero?.species ?? ""
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Status:"
            cell?.detailLabel.text = hero?.status ?? ""
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Type:"
            cell?.detailLabel.text = hero?.type ?? ""
        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: "genderCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Gender:"
            cell?.detailLabel.text = hero?.gender ?? ""
        case 6:
            cell = tableView.dequeueReusableCell(withIdentifier: "originCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Origen:"
            cell?.detailLabel.text = hero?.origin.name ?? ""
        case 7:
            cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? InfoTableViewCell
            cell?.titleLabel.text = "Location:"
            cell?.detailLabel.text = hero?.location.name ?? ""
            
        default:
            cell = UITableViewCell() as? InfoTableViewCell
        }
        return imgCell ?? cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350.0
        } else {
            return 50.0
        }
    }
}

