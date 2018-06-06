//
//  numberData.swift
//  NoDaTa
//
//  Created by dohien on 5/30/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
class numberData: NSObject, UITableViewDataSource {
    var number = Array(1...5)
    var masterview : MasterTableViewController!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            masterview.hasNoData = number.count == 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number[indexPath.row])
        return cell
    }
}
