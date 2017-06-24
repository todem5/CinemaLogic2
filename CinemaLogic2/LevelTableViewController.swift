//
//  LevelTableViewController.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 01.03.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

class LevelTableViewController: UITableViewController {

    var passedValue: String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // В GameViewController задано 3 вида сложности 1,2,3
        //if passedValue == "Игра" {return 3}
        //else {return 2}
        return 3
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //if passedValue == "Игра" {
            cell.textLabel?.text = Level(levelNumber: indexPath.row+1).name
            cell.detailTextLabel?.text = Level(levelNumber: indexPath.row+1).descript
        //}
        return cell
    }
}
