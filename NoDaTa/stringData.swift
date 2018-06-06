//
//  stringData.swift
//  NoDaTa
//
//  Created by dohien on 5/30/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
class stringData: NSObject, UITableViewDataSource {
    var string = ["hien1","hien2","hien3","hien4"]
    var masterview : MasterTableViewController!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return string.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            string.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            masterview.hasNoData = string.count == 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = string[indexPath.row]
        return cell
    }
    
   
}
