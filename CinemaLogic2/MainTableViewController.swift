//
//  MainTableViewController.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 31.10.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var menus = [Menu]()
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 70.0
    let unselectedCellHeight: CGFloat = 70.0
    let textField: String = "Другие разделы"
    var valuetopass: String = ""
    
    func loadMenu() {
        let label01 = UIImage(named: "01")!
        let position1 = Menu(name: "Игра", photo: label01)!
        
        let label02 = UIImage(named: "02")!
        let position2 = Menu(name: "Cтатистика", photo: label02)!
        
        let label03 = UIImage(named: "03")!
        let position3 = Menu(name: "Достижения", photo: label03)!
        
        let label04 = UIImage(named: "04")!
        let position4 = Menu(name: "Помощь", photo: label04)!
        
        let label05 = UIImage(named: "05")!
        let position5 = Menu(name: "Оценить", photo: label05)!
        
        menus += [position1, position2, position3, position4, position5]
    }

    fileprivate struct Storyboard1 {
        static let CellReuseIdentifier1 = "Cell"
        static let SegueIdentifierDetail = "ShowDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //auto resize cell under the text
        //tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 67
        loadMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 3  // section 0 has 3 rows
        case 1: return 2  // section 1 has 2 row
        default: fatalError("Unknown number of sections")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        switch((indexPath as NSIndexPath).section) {
        case 0:
            switch((indexPath as NSIndexPath).row) {
            case 0: cell.nameLabel.text = menus[(indexPath as NSIndexPath).row].name
            cell.imageCell.image = menus[(indexPath as NSIndexPath).row].photo
                cell.nameLabel.textColor = UIColor(white: 114/255, alpha: 1)
            case 1: cell.nameLabel.text = menus[(indexPath as NSIndexPath).row].name
            cell.imageCell.image = menus[(indexPath as NSIndexPath).row].photo
                cell.nameLabel.textColor = UIColor(white: 114/255, alpha: 1)
            case 2: cell.nameLabel.text = menus[(indexPath as NSIndexPath).row].name
            cell.imageCell.image = menus[(indexPath as NSIndexPath).row].photo
                cell.nameLabel.textColor = UIColor(white: 114/255, alpha: 1)
            default: break
            }
        case 1:
            switch((indexPath as NSIndexPath).row) {
            case 0: cell.nameLabel.text = menus[(indexPath as NSIndexPath).row+3].name
            cell.imageCell.image = menus[(indexPath as NSIndexPath).row+3].photo
                cell.nameLabel.textColor = UIColor(white: 114/255, alpha: 1)
            case 1: cell.nameLabel.text = menus[(indexPath as NSIndexPath).row+3].name
            cell.imageCell.image = menus[(indexPath as NSIndexPath).row+3].photo
                cell.nameLabel.textColor = UIColor(white: 114/255, alpha: 1)
            default: break
            }
        default: fatalError("Unknown section")
        }
        
        return cell
    }
    
    func tableView(tableView:UITableView!, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }

    //heightForHeaderInSection и viewForHeaderInSection работают в паре
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 18))
        label.font = UIFont.boldSystemFont(ofSize: 14)
        if (section==1) {label.text = textField}
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0, alpha: 1)
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            print("You selected cell #\(indexPath.row)")
            //Get cell Label
            let indexPath = tableView.indexPathForSelectedRow!
            let currentCell = tableView.cellForRow(at: indexPath)! as! MainTableViewCell
            if (currentCell.nameLabel.text! == "Игра") {
                valuetopass = currentCell.nameLabel.text!
                performSegue(withIdentifier: "Select", sender: self)}
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if (indexPath.row == 0 && indexPath.section == 0) {
                if (segue.identifier == "Select") {
                    let viewContr1 = segue.destination as! GameViewController
                    viewContr1.passedValue = self.menus[indexPath.row].name
                }
            }
            if (indexPath.row == 1 && indexPath.section == 0) {
                let viewContr2 = segue.destination as! LevelTableViewController
                    viewContr2.passedValue = self.menus[indexPath.row].name
            }
        }
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //старые остатки другого типа  сегвея
    //    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        print("You selected cell #\(indexPath.row)")
    //        //Get cell Label
    //        let indexPath = tableView.indexPathForSelectedRow!
    //        let currentCell = tableView.cellForRow(at: indexPath)! as! MainTableViewCell
    //        valuetopass = currentCell.nameLabel.text!
    //        performSegue(withIdentifier: "Select", sender: self)
    //    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if (segue.identifier == "Select") {
    //            let viewController = segue.destination as! LevelTableViewController
    //            viewController.passedValue = valuetopass
    //        }
    //    }


}
