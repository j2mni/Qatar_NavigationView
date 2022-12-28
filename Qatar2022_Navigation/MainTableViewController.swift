//
//  MainTableViewController.swift
//  Qatar2022_Navigation
//
//  Created by yeonji on 2022/10/18.
//

import UIKit

class MainTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
//    func getKey(section:Int)->String {
//        let keys = nations.keys.sorted()
//        return keys[section]
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return nations.count //8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keys = nations.keys.sorted() //["A", "B", "C","D","E","F","G","H"]
        let key = keys[section] //section 0~7 key="A"~"H"
//        let key = getKey(section: section)
        
        //Optional Unwrapping
        if let group:[Nation] = nations[key] {
            return group.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let keys = nations.keys.sorted() //["A", "B", "C"... "H"]
//        let key = keys[indexPath.section]
//        guard let group = nations[key] else { fatalError() }
//        let nation = group[indexPath.row]
        
        let keys = nations.keys.sorted() //["A", "B", "C","D","E","F","G","H"]
        let key = keys[indexPath.section] //section 0~7 key="A"~"H"
        
        guard let group = nations[key] else { fatalError() }
        let nation = group[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NationCell", for: indexPath)
        
        let imageFlag = cell.viewWithTag(1) as? UIImageView
        imageFlag?.image = UIImage(named: nation.flag)
        
        let lblName = cell.viewWithTag(2) as? UILabel
        lblName?.text = nation.name
        
        let lblGroup = cell.viewWithTag(3) as? UILabel
        lblGroup?.text = "Group \(nation.group)"
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        let label = UILabel()
//        let keys = nations.keys.sorted() //["A", "B", "C","D","E","F","G","H"]
//        let key = keys[section] //section 0~7 key="A"~"H"
//        label.text = "Group \(key)"
//        label.font = .boldSystemFont(ofSize: 30)
//        label.text
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var label = UILabel()
        let keys = nations.keys.sorted()
        let key = keys[section]
        label.text = "Group \(key)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.backgroundColor = .systemPink
        return label
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let keys = nations.keys.sorted()
        let key = keys[indexPath.section]
        
        if let group = nations[key] {
            let nation = group[indexPath.row]
            let dest = segue.destination as? DetailViewController
            dest?.nation = nation
        }
        
        
        
    }
    

}
