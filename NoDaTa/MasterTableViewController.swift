//
//  MasterTableViewController.swift
//  NoDaTa
//
//  Created by dohien on 5/30/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    let numBerdata = numberData()
    let stringdata = stringData()
    
    @IBOutlet weak var swithButton: UISwitch!
    @IBOutlet weak var footerview: UIView!
    @IBOutlet var NoData: UIView!
    var hasNoData : Bool = false {
        didSet{
            hasNoData ? (tableView.tableFooterView = NoData) : (tableView.tableFooterView = footerview)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = numBerdata
        // self : chinh no'
        numBerdata.masterview = self
        stringdata.masterview = self
    }
    @IBAction func swithButton(_ sender: UISwitch) {
        swithButton.isOn ? (tableView.dataSource = numBerdata) : (tableView.dataSource = stringdata)
        swithButton.isOn ? (hasNoData = numBerdata.number.count == 0) : (hasNoData = stringdata.string.count == 0)
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // load lai du lieu
        swithButton.isOn ? (hasNoData = numBerdata.number.count == 0) : (hasNoData = stringdata.string.count
         == 0)
        
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
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let detailviewcontroller = unwindSegue.source as? Dtailviewcontroller{
            if let index = tableView.indexPathForSelectedRow?.row{
                swithButton.isOn ? (numBerdata.number[index] = Int(detailviewcontroller.Data ?? "") ?? 0) : (stringdata.string[index] = detailviewcontroller.Data ?? "")
            }else{
                swithButton.isOn ? (numBerdata.number.append(Int(detailviewcontroller.Data ?? "") ?? 0)) : (stringdata.string.append(detailviewcontroller.Data ?? ""))
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailviewcontroller = segue.destination as? Dtailviewcontroller{
            if let index = tableView.indexPathForSelectedRow?.row{
                swithButton.isOn ? (detailviewcontroller.Data = String(numBerdata.number[index])) : (detailviewcontroller.Data = stringdata.string[index])
            }
        }
    }
    

}
